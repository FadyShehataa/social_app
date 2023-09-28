import 'package:flutter/material.dart';

import '../../../../../Core/utils/icon_broken.dart';

class PostBody extends StatelessWidget {
  const PostBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
              'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum!'),
        ),
        Image.network(
          'https://img.freepik.com/free-photo/portrait-beautiful-young-woman-standing-grey-wall_231208-10760.jpg?w=996&t=st=1695886677~exp=1695887277~hmac=c6b9869ca54d6473d48a51a6a561ad3d64e3b8d51ef608bcb461db70dd0a174b',
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
              label: const Text('1200'),
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
  }
}
