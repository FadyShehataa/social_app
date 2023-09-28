import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 25.0,
          backgroundImage: NetworkImage(
              'https://img.freepik.com/free-photo/portrait-beautiful-young-woman-standing-grey-wall_231208-10760.jpg?w=996&t=st=1695886677~exp=1695887277~hmac=c6b9869ca54d6473d48a51a6a561ad3d64e3b8d51ef608bcb461db70dd0a174b'),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Fady Shehata',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              'jan 1, 2021 at 11:00 pm',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_horiz,
          ),
        ),
      ],
    );
  }
}
