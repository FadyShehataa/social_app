import 'package:flutter/material.dart';

import '../../../../../Core/widgets/custom_app_bar.dart';

class CreatePostHeader extends StatelessWidget {
  const CreatePostHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      kContext: context,
      title: 'Create Post',
      actions: [
        TextButton(
          onPressed: () {},
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
