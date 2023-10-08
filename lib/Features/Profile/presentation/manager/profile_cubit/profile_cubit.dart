import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/repos/edit_profilr_repo_impl.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.editProfileRepo) : super(ProfileInitial());

  final EditProfileRepoImpl editProfileRepo;

  File? profileImage;
  File? coverImage;
  var picker = ImagePicker();

  Future<void> getProfileImage() async {
    emit(ProfileImagePickedLoadingState());
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(ProfileImagePickedSuccessState());
    } else {
      emit(ProfileImagePickedFailureState());
    }
  }

  Future<void> getCoverImage() async {
    emit(CoverImagePickedLoadingState());
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(CoverImagePickedSuccessState());
    } else {
      emit(CoverImagePickedFailureState());
    }
  }
}
