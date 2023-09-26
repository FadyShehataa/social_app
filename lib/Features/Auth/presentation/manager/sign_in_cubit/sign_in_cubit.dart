import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  
  // get object of sign in cubit
  static SignInCubit get(context) => BlocProvider.of<SignInCubit>(context);

  bool isPassword = true;
  IconData suffixIcon = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SignInChangePasswordVisibilityState());
  }

  // function to SignIn user with email and password firebase
  Future<void> userSignIn({
    required String email,
    required String password,
  }) async {
    emit(SignInLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(const SignInFailureState(
            errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(const SignInFailureState(
            errorMessage: 'The account already exists for that email.'));
      } else {
        emit(SignInFailureState(errorMessage: e.code));
      }
    } catch (e) {
      emit(SignInFailureState(errorMessage: e.toString()));
    }
  }
}
