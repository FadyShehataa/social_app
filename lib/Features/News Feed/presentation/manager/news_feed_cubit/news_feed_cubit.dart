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
  var likes = 5 ;
  Future<void> updateLikePost({required PostModel postModel}) async {
    var result = await newsFeedRepo.updateLikePost(postModel: postModel);
    likes++;
    print('likes  $likes');
    print('here in cubit');
    emit(UpdateLikePostState());
  }
}
