import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:social_app/Core/utils/app_router.dart';

class LoginToRegisterSection extends StatelessWidget {
  const LoginToRegisterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () => GoRouter.of(context).go(AppRouter.kRegisterView),
          child: const Text(
            'REGISTER',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
