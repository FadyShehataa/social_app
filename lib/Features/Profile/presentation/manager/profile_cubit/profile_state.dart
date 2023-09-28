part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileImagePickedSuccess extends ProfileState {}

final class ProfileImagePickedFailure extends ProfileState {}

final class CoverImagePickedSuccess extends ProfileState {}

final class CoverImagePickedFailure extends ProfileState {}
