import 'package:flutter/material.dart';
import 'package:social_app/Core/utils/constants.dart';

import '../../../../../Core/widgets/custom_text_form_field.dart';

class CreatePostBody extends StatelessWidget {
  const CreatePostBody({super.key, required this.postController});
  final TextEditingController postController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(user.image!),
                ),
                const SizedBox(width: 10),
                Text(
                  user.name!,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomTextFormField(
              controller: postController,
              hintText: 'What\'s on your mind...',
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
