import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  
  // get object of sign in cubit
  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);

  bool isPassword = true;
  IconData suffixIcon = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }

  // function to SignIn user with email and password firebase
  Future<void> userSignIn({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(const RegisterFailureState(
            errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(const RegisterFailureState(
            errorMessage: 'The account already exists for that email.'));
      } else {
        emit(RegisterFailureState(errorMessage: e.code));
      }
    } catch (e) {
      emit(RegisterFailureState(errorMessage: e.toString()));
    }
  }
}
