import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/utils/app_router.dart';

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            child: const Text('Add Photos'),
          ),
        ),
        const SizedBox(width: 10),
        OutlinedButton(
          onPressed: () =>
              GoRouter.of(context).push(AppRouter.kEditProfileView),
          child: const Icon(Icons.edit),
        ),
      ],
    );
  }
}
