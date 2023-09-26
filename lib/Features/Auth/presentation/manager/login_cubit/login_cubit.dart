import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // get object of login cubit
  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);

  bool isPassword = true;
  IconData suffixIcon = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());
  }

  // function to login user with email and password firebase
  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const LoginFailureState(
            errorMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(const LoginFailureState(
            errorMessage: 'Wrong password provided for that user.'));
      } else {
        emit(LoginFailureState(errorMessage: e.code));
      }
    } catch (e) {
      emit(LoginFailureState(errorMessage: e.toString()));
    }
  }
}
