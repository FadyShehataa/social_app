import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/utils/icon_broken.dart';
import '../../../data/models/post_model.dart';
import '../../manager/news_feed_cubit/news_feed_cubit.dart';

class PostBody extends StatelessWidget {
  const PostBody({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    var likes = BlocProvider.of<NewsFeedCubit>(context).likes;

    return BlocConsumer<NewsFeedCubit, NewsFeedState>(
      listener: (context, state) {
        if (state is UpdateLikePostState) {
          likes = BlocProvider.of<NewsFeedCubit>(context).likes;
          print(likes);
          print('here in view');
        }
      },
      builder: (context, state) {
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
                  label:
                      Text(likes.toString()), // TODO likes change in database
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
      },
    );
  }
}
