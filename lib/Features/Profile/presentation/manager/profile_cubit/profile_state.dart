part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileImagePickedSuccessState extends ProfileState {}

final class ProfileImagePickedFailureState extends ProfileState {}

final class ProfileImagePickedLoadingState extends ProfileState {}

final class CoverImagePickedSuccessState extends ProfileState {}

final class CoverImagePickedFailureState extends ProfileState {}

final class CoverImagePickedLoadingState extends ProfileState {}

final class EditProfileLoadingState extends ProfileState {}

final class EditProfileSuccessState extends ProfileState {}

final class EditProfileFailureState extends ProfileState {
  final String errorMessage;

  const EditProfileFailureState({required this.errorMessage});
}
