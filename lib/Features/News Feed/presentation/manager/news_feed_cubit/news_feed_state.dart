part of 'news_feed_cubit.dart';

sealed class NewsFeedState extends Equatable {
  const NewsFeedState();

  @override
  List<Object> get props => [];
}

final class NewsFeedInitial extends NewsFeedState {}

// Create post
final class CreatePostSuccessState extends NewsFeedState {}

final class CreatePostFailureState extends NewsFeedState {
  final String errorMessage;

  const CreatePostFailureState({required this.errorMessage});
}

final class CreatePostLoadingState extends NewsFeedState {}

// Get posts
final class GetPostsSuccessState extends NewsFeedState {
  final List<PostModel> posts;

  const GetPostsSuccessState({required this.posts});
}

final class GetPostsFailureState extends NewsFeedState {
  final String errorMessage;

  const GetPostsFailureState({required this.errorMessage});
}

final class GetPostsLoadingState extends NewsFeedState {}

// Update like post
final class UpdateLikePostLoadingState extends NewsFeedState {}

final class UpdateLikePostSuccessState extends NewsFeedState {}

final class UpdateLikePostFailureState extends NewsFeedState {
  final String errorMessage;

  const UpdateLikePostFailureState({required this.errorMessage});
}
