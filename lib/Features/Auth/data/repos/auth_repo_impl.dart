import 'package:dartz/dartz.dart';

import 'package:social_app/Core/errors/failures.dart';

import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, void>> userLogin() {
    // TODO: implement userLogin
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> userRegister() {
    // TODO: implement userRegister
    throw UnimplementedError();
  }
}
