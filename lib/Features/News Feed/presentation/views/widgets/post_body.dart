import 'package:flutter/material.dart';

import '../../../../../Core/utils/icon_broken.dart';
import '../../../data/models/post_model.dart';

class PostBody extends StatelessWidget {
  const PostBody({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(post.text!),
        ),
        if (post.postImage != '')
          Image.network(
            post.postImage!,
            width: double.infinity,
            height: 220.0,
            fit: BoxFit.cover,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(IconBroken.Heart),
              label: Text(post.likes!.length.toString()),
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(IconBroken.Chat),
              label: const Text('521 Comments'),
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
            ),
          ],
        ),
      ],
    );
  }
}
