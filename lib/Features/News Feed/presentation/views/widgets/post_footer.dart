import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Core/utils/constants.dart';

import '../../../../../Core/utils/icon_broken.dart';
import '../../../data/models/post_model.dart';
import '../../manager/news_feed_cubit/news_feed_cubit.dart';

class PostFooter extends StatelessWidget {
  const PostFooter({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    bool isLike = BlocProvider.of<NewsFeedCubit>(context)
        .posts
        .firstWhere((element) => element.postId == post.postId)
        .likes!
        .contains(uId);
    return Row(
      children: [
        Expanded(
          child: TextButton.icon(
            onPressed: () => BlocProvider.of<NewsFeedCubit>(context)
                .updateLikePost(postModel: post),
            icon: Icon(
              IconBroken.Heart,
              color: isLike ? Colors.red : Colors.grey,
            ),
            label: Text(
              'Like',
              style: TextStyle(color: isLike ? Colors.red : Colors.grey),
            ),
          ),
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              IconBroken.Chat,
              color: Colors.grey,
            ),
            label: const Text(
              'Comment',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
