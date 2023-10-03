import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/widgets/custom_app_bar.dart';
import 'package:social_app/Features/Chat/presentation/views/widgets/chat_bubble.dart';
import 'package:social_app/Features/Chat/presentation/views/widgets/chat_bubble_for_friend.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/custom_divider.dart';

import '../../../../Core/models/user_model.dart';
import '../../../../Core/utils/constants.dart';
import '../../../../Core/utils/icon_broken.dart';
import '../../../../Core/utils/styles.dart';
import '../manager/chat_cubit/chat_cubit.dart';

class ChatDetailsView extends StatelessWidget {
  ChatDetailsView({super.key, required this.userModel});

  final messageController = TextEditingController();
  final scrollController = ScrollController();

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              kContext: context,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: defaultRadius,
                    backgroundImage: NetworkImage(user.image!),
                  ),
                  const SizedBox(width: 10),
                  const Text('Fady Shehata', style: Styles.textStyle18),
                ],
              ),
            ),
            const SizedBox(height: 5),
            const CustomDivider(),
            BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
              return Expanded(
                child: ListView.builder(
                  reverse: true,
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    if (BlocProvider.of<ChatCubit>(context)
                            .messages[index]
                            .senderId ==
                        uId) {
                      return ChatBubble(
                        message:
                            BlocProvider.of<ChatCubit>(context).messages[index],
                      );
                    } else {
                      return ChatBubbleForFriend(
                        message:
                            BlocProvider.of<ChatCubit>(context).messages[index],
                      );
                    }
                  },
                  itemCount:
                      BlocProvider.of<ChatCubit>(context).messages.length,
                ),
              );
            }),
            Padding(
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
                      onPressed: () {
                        BlocProvider.of<ChatCubit>(context).sendMessage(
                          receiverId: userModel.uId!,
                          dateTime: DateTime.now().toString(),
                          text: messageController.text,
                        );
                        messageController.clear();

                        // chat not scroll to bottom
                        scrollController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
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
            ),
          ],
        ),
      ),
    );
  }
}
