import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:social_app/Core/utils/constants.dart';
import 'package:social_app/Features/News%20Feed/presentation/manager/news_feed_cubit/news_feed_cubit.dart';

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
        DropdownButtonHideUnderline(
          child: DropdownButton(
            icon: const Icon(Icons.more_horiz),
            items: [
              DropdownMenuItem(
                value: PostOptions.edit.name,
                child: const Text('Edit'),
              ),
              DropdownMenuItem(
                value: PostOptions.delete.name,
                child: const Text('Delete'),
              ),
            ],
            onChanged: (value) {
              if (value == PostOptions.edit.name) {
                // navigate to edit post screen
              } else if (value == PostOptions.delete.name) {
                showDeleteDialog(context);
              }
            },
            padding: const EdgeInsets.only(right: 10),
          ),
        )
      ],
    );
  }

  Future<dynamic> showDeleteDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Post'),
        content: const Text('Are you sure you want to delete this post?'),
        actions: [
          TextButton(
            onPressed: () => GoRouter.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              GoRouter.of(context).pop();
              BlocProvider.of<NewsFeedCubit>(context)
                  .deletePost(postModel: post);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

enum PostOptions { edit, delete }
