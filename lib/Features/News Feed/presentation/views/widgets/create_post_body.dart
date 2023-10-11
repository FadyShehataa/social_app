import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Core/widgets/custom_text_form_field.dart';
import '../../manager/news_feed_cubit/news_feed_cubit.dart';

class CreatePostBody extends StatelessWidget {
  const CreatePostBody({super.key, required this.postController});
  final TextEditingController postController;

  @override
  Widget build(BuildContext context) {
    var postImage = BlocProvider.of<NewsFeedCubit>(context).postImage;
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: CustomTextFormField(
              controller: postController,
              labelText: 'What\'s on your mind...',
              border: InputBorder.none,
              maxLines: 2000,
              labelStyle: const TextStyle(fontSize: 30),
              style: const TextStyle(fontSize: 30),
            ),
          ),
          if (postImage != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  postImage.path,
                  fit: BoxFit.cover,
                ),
                // child: const Text('postImage'),
              ),
            ),
        ],
      ),
    );
  }
}
