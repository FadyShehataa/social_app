import 'package:flutter/material.dart';

import '../../../../../Core/utils/icon_broken.dart';

class CreatePostFooter extends StatelessWidget {
  const CreatePostFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(IconBroken.Image),
          label: const Text('add photo'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('# tags'),
        ),
      ],
    );
  }
}
