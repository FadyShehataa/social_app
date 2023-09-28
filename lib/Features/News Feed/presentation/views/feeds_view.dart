import 'package:flutter/material.dart';

import 'widgets/post_item.dart';

class FeedsView extends StatelessWidget {
  const FeedsView({super.key});

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
