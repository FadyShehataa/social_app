import 'package:flutter/material.dart';
import 'package:social_app/Core/widgets/custom_app_bar.dart';
import 'package:social_app/Features/Chat/presentation/views/widgets/chat_bubble.dart';
import 'package:social_app/Features/Chat/presentation/views/widgets/chat_bubble_for_friend.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/custom_divider.dart';

import '../../../../Core/utils/constants.dart';
import '../../../../Core/utils/icon_broken.dart';
import '../../../../Core/utils/styles.dart';

class ChatDetailsView extends StatelessWidget {
  ChatDetailsView({super.key});

  final messageController = TextEditingController();

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
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemBuilder: (context, index) {
                  return const ChatBubbleForFriend();
                },
                itemCount: 10,
              ),
            ),
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
                      onPressed: () {},
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
