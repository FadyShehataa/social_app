import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/utils/constants.dart';
import '../../../../../Core/utils/icon_broken.dart';
import '../../../data/models/post_model.dart';
import '../../manager/news_feed_cubit/news_feed_cubit.dart';

class PostFooter extends StatelessWidget {
  const PostFooter({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15.0,
          backgroundImage: NetworkImage(user.image!),
        ),
        const SizedBox(width: 10),
        const Text('Write a comment ...'),
        const Spacer(),
        TextButton.icon(
          onPressed: () => BlocProvider.of<NewsFeedCubit>(context)
                .updateLikePost(postModel: post),
          icon: const Icon(IconBroken.Heart),
          label: const Text('Like'),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(IconBroken.Upload),
          label: const Text('Share'),
        ),
      ],
    );
  }
}
