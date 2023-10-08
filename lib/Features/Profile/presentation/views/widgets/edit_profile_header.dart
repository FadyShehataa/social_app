import 'package:flutter/material.dart';

import '../../../../../Core/widgets/custom_app_bar.dart';

class EditProfileHeader extends StatelessWidget {
  const EditProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      context: context,
      title: const Text(
        'Edit Profile',
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'UPDATE',
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(width: 10)
      ],
    );
  }
}
