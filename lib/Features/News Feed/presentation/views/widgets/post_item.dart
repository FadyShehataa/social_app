import 'package:flutter/material.dart';
import 'package:social_app/Features/News%20Feed/data/models/post_model.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/post_body.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/post_footer.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/post_header.dart';

import 'custom_divider.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeader(post: post),
            const CustomDivider(),
            PostBody(post: post),
            const CustomDivider(),
            PostFooter(post: post), 
          ],
        ),
      ),
    );
  }
}
