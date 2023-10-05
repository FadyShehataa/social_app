import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_app/Core/utils/constants.dart';

import '../../../data/models/post_model.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: defaultRadius,
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
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              '${DateFormat.MMMMd().format(DateTime.parse(post.dateTime!))} at ${DateFormat.Hm().format(DateTime.parse(post.dateTime!))} ',
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
            Icons.more_vert,
          ),
        ),
      ],
    );
  }
}
