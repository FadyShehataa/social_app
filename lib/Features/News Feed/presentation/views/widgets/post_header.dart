import 'package:flutter/material.dart';

import '../../../data/models/post_model.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25.0,
          backgroundImage: NetworkImage(post.image!),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.name!,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              post.dateTime!,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz,
          ),
        ),
      ],
    );
  }
}
