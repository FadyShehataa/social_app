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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.text!, style: const TextStyle(fontSize: 20)),
          if (post.postImage != '')
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.network(
                post.postImage!,
                width: double.infinity,
                height: 220.0,
                fit: BoxFit.cover,
              ),
            ),
          BlocBuilder<NewsFeedCubit, NewsFeedState>(
            builder: (context, state) {
              int likes = BlocProvider.of<NewsFeedCubit>(context)
                  .posts
                  .firstWhere((element) => element.postId == post.postId)
                  .likes!
                  .length;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  if (likes != 0)
                    TextButton.icon(
                      onPressed: () {},
                      icon: Text(
                        likes.toString(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      label: const Icon(
                        IconBroken.Heart,
                        color: Colors.grey,
                      ),
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Text(
                      '521',
                      style: TextStyle(color: Colors.grey),
                    ),
                    label: const Icon(
                      IconBroken.Chat,
                      color: Colors.grey,
                    ),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
