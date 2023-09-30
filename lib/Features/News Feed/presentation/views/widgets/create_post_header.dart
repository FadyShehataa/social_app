import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/widgets/custom_app_bar.dart';
import '../../manager/news_feed_cubit/news_feed_cubit.dart';

class CreatePostHeader extends StatelessWidget {
  const CreatePostHeader({
    super.key, required this.postController,
  });

  final TextEditingController postController;

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      kContext: context,
      title: 'Create Post',
      actions: [
        TextButton(
          onPressed: () {
            BlocProvider.of<NewsFeedCubit>(context).createPost(
              text: postController.text,
              dateTime: DateTime.now().toString(),
              postImage: '',
            );
          },
          child: const Text(
            'POST',
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}