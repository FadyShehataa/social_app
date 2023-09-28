import 'package:flutter/material.dart';
import 'package:social_app/Core/widgets/custom_app_bar.dart';

class NewPostView extends StatelessWidget {
  const NewPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'New Post',
      ),
      body: const Center(
        child: Text(
          'New Post',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
