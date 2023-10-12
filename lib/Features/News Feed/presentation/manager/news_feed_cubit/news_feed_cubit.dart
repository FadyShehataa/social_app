import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/Features/News%20Feed/data/repos/news_feed_repo_impl.dart';

import '../../../data/models/post_model.dart';

part 'news_feed_state.dart';

class NewsFeedCubit extends Cubit<NewsFeedState> {
  NewsFeedCubit(this.newsFeedRepo) : super(NewsFeedInitial());

  final NewsFeedRepoImpl newsFeedRepo;

  File? postImage;
  var picker = ImagePicker();

  Future<void> getPostImage() async {
    emit(PostImagePickedLoadingState());
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(PostImagePickedSuccessState());
    } else {
      emit(PostImagePickedFailureState());
    }
  }

  void removePostImage() {
    postImage = null;
    emit(RemovePostImageState());
  }

  Future<void> createPost({
    required String text,
    required String dateTime,
  }) async {
    emit(CreatePostLoadingState());

    var result = await newsFeedRepo.createPost(
      dateTime: dateTime,
      text: text,
      postImage: postImage,
    );

    result.fold(
      (failure) =>
          emit(CreatePostFailureState(errorMessage: failure.errMessage)),
      (_) => emit(CreatePostSuccessState()),
    );
  }

  Future<void> editPost({
    required String text,
    required String dateTime,
    required String postId,
    required List<String> likes,
  }) async {
    emit(EditPostLoadingState());

    var result = await newsFeedRepo.editPost(
      dateTime: dateTime,
      text: text,
      postImage: postImage,
      postId: postId,
      likes: likes,
    );

    result.fold(
      (failure) => emit(EditPostFailureState(errorMessage: failure.errMessage)),
      (_) => emit(EditPostSuccessState()),
    );
  }

  List<PostModel> posts = [];
  Future<void> getPosts() async {
    emit(GetPostsLoadingState());

    var result = await newsFeedRepo.getPosts();

    result.fold(
      (failure) => emit(GetPostsFailureState(errorMessage: failure.errMessage)),
      (posts) {
        this.posts = posts;
        emit(GetPostsSuccessState(posts: posts));
      },
    );
  }

  // update like post
  Future<void> updateLikePost({required PostModel postModel}) async {
    emit(UpdateLikePostLoadingState());
    var result = await newsFeedRepo.updateLikePost(postModel: postModel);

    result.fold(
      (failure) => emit(GetPostsFailureState(errorMessage: failure.errMessage)),
      (posts) => emit(UpdateLikePostSuccessState()),
    );
  }

  // update save post
  Future<void> updateSavePost({required PostModel postModel}) async {
    emit(UpdateSavePostLoadingState());
    var result = await newsFeedRepo.updateSavePost(postModel: postModel);

    result.fold(
      (failure) =>
          emit(UpdateSavePostFailureState(errorMessage: failure.errMessage)),
      (_) => emit(UpdateSavePostSuccessState()),
    );
  }

  Future<void> deletePost({required PostModel postModel}) async {
    emit(DeletePostLoadingState());
    var result = await newsFeedRepo.deletePost(postModel: postModel);
    result.fold(
      (failure) =>
          emit(DeletePostFailureState(errorMessage: failure.errMessage)),
      (_) => emit(DeletePostSuccessState()),
    );
  }
}
