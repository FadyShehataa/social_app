import 'package:flutter/material.dart';
import 'package:social_app/Core/utils/constants.dart';
import 'package:social_app/Features/Chat/data/models/message_model.dart';

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({
    Key? key,
    required this.message,
  }) : super(key: key);

  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    print(message);
    print('uis = $uId');
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: Color(0xff2B475E),
        ),
        child: Text(
          message.text!,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
