import 'package:flutter/material.dart';

class LoginButtonSection extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginButtonSection({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(14),
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // TODO: Login
              }
            },
            child: const Text(
              'LOGIN',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
