import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Features/Chat/data/repos/chat_repo_impl.dart';

import '../../../../../Core/models/user_model.dart';
import '../../../../../Core/utils/constants.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.chatRepo) : super(ChatInitial());

  final ChatRepoImpl chatRepo;
  late final List<UserModel> users;
  List<UserModel> searchedChats = [];

  Future<void> getAllUsers() async {
    emit(GetAllUsersLoading());
    var result = await chatRepo.getAllUsers();
    result.fold(
      (failure) => emit(GetAllUsersFailure(errorMessage: failure.errMessage)),
      (users) {
        this.users = users.where((element) => element.uId != uId).toList();
        searchedChats = this.users;
        emit(GetAllUsersSuccess());
      },
    );
  }

  Future<void> searchChat(String query) async {
    emit(ChatsSearching());
    searchedChats = users
        .where((element) =>
            element.name!.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    emit(GetAllUsersSuccess());
  }
}
