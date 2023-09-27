import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:social_app/Core/errors/failures.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  
  @override
  Future<Either<Failure, void>> userLogin({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return left(ServerFailure(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        return left(ServerFailure(
            errMessage: 'Wrong password provided for that user.'));
      } else {
        return left(ServerFailure(errMessage: e.message.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> userRegister({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return left(
            ServerFailure(errMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return left(ServerFailure(
            errMessage: 'The account already exists for that email.'));
      } else {
        return left(ServerFailure(errMessage: e.message.toString()));
      }
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
