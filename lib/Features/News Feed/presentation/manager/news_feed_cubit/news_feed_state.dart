part of 'news_feed_cubit.dart';

sealed class NewsFeedState extends Equatable {
  const NewsFeedState();

  @override
  List<Object> get props => [];
}

final class NewsFeedInitial extends NewsFeedState {}

final class CreatePostSuccessState extends NewsFeedState {}

final class CreatePostFailureState extends NewsFeedState {
  final String errorMessage;

  const CreatePostFailureState({required this.errorMessage});
}

final class CreatePostLoadingState extends NewsFeedState {}
