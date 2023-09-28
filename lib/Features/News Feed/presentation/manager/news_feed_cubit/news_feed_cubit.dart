import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Features/News%20Feed/data/repos/news_feed_repo_impl.dart';

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
}
