import 'package:flutter/material.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/create_post_body.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/create_post_footer.dart';
import 'package:social_app/Features/News%20Feed/presentation/views/widgets/create_post_header.dart';

class CreatePostView extends StatelessWidget {
  CreatePostView({super.key});

  final TextEditingController postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CreatePostHeader(),
            CreatePostBody(postController: postController),
            const CreatePostFooter(),
          ],
        ),
      ),
    );
  }
}
