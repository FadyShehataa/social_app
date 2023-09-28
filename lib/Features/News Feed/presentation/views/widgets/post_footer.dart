import 'package:flutter/material.dart';

import '../../../../../Core/utils/icon_broken.dart';

class PostFooter extends StatelessWidget {
  const PostFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 15.0,
          backgroundImage: NetworkImage(
              'https://img.freepik.com/free-photo/portrait-beautiful-young-woman-standing-grey-wall_231208-10760.jpg?w=996&t=st=1695886677~exp=1695887277~hmac=c6b9869ca54d6473d48a51a6a561ad3d64e3b8d51ef608bcb461db70dd0a174b'),
        ),
        const SizedBox(width: 10),
        const Text('Write a comment ...'),
        const Spacer(),
        TextButton.icon(
          onPressed: () {},
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
