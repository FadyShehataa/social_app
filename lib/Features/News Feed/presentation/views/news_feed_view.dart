import 'package:flutter/material.dart';

import 'widgets/post_item.dart';

class NewsFeedView extends StatelessWidget {
  const NewsFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const PostItem();
        },
        itemCount: 10,
      ),
    );
  }
}
