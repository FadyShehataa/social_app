part of 'sign_in_cubit.dart';

sealed class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

final class SignInInitial extends SignInState {}

final class SignInLoadingState extends SignInState {}

final class SignInSuccessState extends SignInState {}

final class SignInFailureState extends SignInState {
  final String errorMessage;

  const SignInFailureState({required this.errorMessage});
}

final class SignInChangePasswordVisibilityState extends SignInState {}
