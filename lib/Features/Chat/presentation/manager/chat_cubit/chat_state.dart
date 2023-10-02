part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

// get all users for chat view
final class GetAllUsersSuccess extends ChatState {}

final class GetAllUsersFailure extends ChatState {
  final String errorMessage;

  const GetAllUsersFailure({required this.errorMessage});
}

final class GetAllUsersLoading extends ChatState {}

// search for users
final class ChatsSearching extends ChatState {}
