import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Features/News%20Feed/presentation/manager/news_feed_cubit/news_feed_cubit.dart';

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
        BlocBuilder<NewsFeedCubit, NewsFeedState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(IconBroken.Heart),
                  label: Text(BlocProvider.of<NewsFeedCubit>(context)
                      .posts
                      .firstWhere((element) => element.postId == post.postId)
                      .likes!
                      .length
                      .toString()),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(IconBroken.Chat),
                  label: const Text('521 Comments'),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
