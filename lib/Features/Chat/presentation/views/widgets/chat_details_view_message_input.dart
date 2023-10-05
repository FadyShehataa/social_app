import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/models/user_model.dart';
import '../../../../../Core/utils/icon_broken.dart';
import '../../manager/chat_cubit/chat_cubit.dart';

class ChatDetailsViewMessageInput extends StatelessWidget {
  const ChatDetailsViewMessageInput(
      {super.key,
      required this.messageController,
      required this.scrollController,
      required this.userModel});

  final TextEditingController messageController;
  final ScrollController scrollController;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  hintText: 'Type a message...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => sendMessage(context),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 50),
              ),
              child: const Icon(
                IconBroken.Send,
                color: Colors.white,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage(BuildContext context) {
    BlocProvider.of<ChatCubit>(context).sendMessage(
      receiverId: userModel.uId!,
      dateTime: DateTime.now().toString(),
      text: messageController.text,
    );
    messageController.clear();
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}