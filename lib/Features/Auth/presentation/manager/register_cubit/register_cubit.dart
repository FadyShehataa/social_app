import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitialState());
  final AuthRepo authRepo;

  static RegisterCubit get(context) => BlocProvider.of<RegisterCubit>(context);

  bool isPassword = true;
  IconData suffixIcon = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }

  Future<void> userSignIn({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());

    var result = await authRepo.userRegister(email: email, password: password);

    result.fold(
      (failure) => emit(RegisterFailureState(errorMessage: failure.errMessage)),
      (_) => emit(RegisterSuccessState()),
    );
  }
}
