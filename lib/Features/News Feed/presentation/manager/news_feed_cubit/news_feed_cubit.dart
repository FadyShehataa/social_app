import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Features/News%20Feed/data/repos/news_feed_repo_impl.dart';

import '../../../data/models/post_model.dart';

part 'news_feed_state.dart';

class NewsFeedCubit extends Cubit<NewsFeedState> {
  NewsFeedCubit(this.newsFeedRepo) : super(NewsFeedInitial());

  final NewsFeedRepoImpl newsFeedRepo;

  Future<void> createPost({
    required String text,
    required String dateTime,
    required String postImage,
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

  Future<void> getPosts() async {
    emit(GetPostsLoadingState());

    var result = await newsFeedRepo.getPosts();

    result.fold(
      (failure) => emit(GetPostsFailureState(errorMessage: failure.errMessage)),
      (posts) => emit(GetPostsSuccessState(posts: posts)),
    );
  }

  Future<void> likePost({required String postId}) async {
    // emit(LikePostLoadingState());

    var result = await newsFeedRepo.likePost(postId: postId);

    // result.fold(
    //   (failure) => emit(LikePostFailureState(errorMessage: failure.errMessage)),
    //   (_) => emit(LikePostSuccessState()),
    // );
  }

}
