import 'package:flutter/material.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/post_body.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/post_footer.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/post_header.dart';

import 'custom_divider.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeader(),
            CustomDivider(),
            PostBody(),
            CustomDivider(),
            PostFooter(),
          ],
        ),
      ),
    );
  }
}
