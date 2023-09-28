import 'package:flutter/material.dart';
import 'package:social_app/Core/widgets/custom_app_bar.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        title: 'Edit Profile',
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'UPDATE',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }
}
