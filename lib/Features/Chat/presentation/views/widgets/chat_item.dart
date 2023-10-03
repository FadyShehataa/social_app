import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_app/Core/models/user_model.dart';
import 'package:social_app/Core/utils/app_router.dart';
import 'package:social_app/Core/utils/constants.dart';
import 'package:social_app/Core/utils/styles.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.userModel});

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context).push(AppRouter.kChatDetailsView),
      child: Row(
        children: [
          CircleAvatar(
            radius: defaultRadius,
            backgroundImage: NetworkImage(userModel.image!),
          ),
          const SizedBox(width: 10),
          Text(userModel.name!, style: Styles.textStyle18),
        ],
      ),
    );
  }
}
