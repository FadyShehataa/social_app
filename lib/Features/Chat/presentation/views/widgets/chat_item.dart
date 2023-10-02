import 'package:flutter/material.dart';

import '../../../../../Core/utils/constants.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          backgroundImage: NetworkImage(user.image!),
        ),
        const SizedBox(width: 10),
        const Text(
          'Fady Shehata',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
