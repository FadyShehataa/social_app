import 'package:flutter/material.dart';

import '../../manager/sign_in_cubit/sign_in_cubit.dart';

class RegisterButtonSection extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterButtonSection({
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
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                await SignInCubit.get(context).userSignIn(
                  email: emailController.text,
                  password: passwordController.text,
                );
              }
            },
            child: const Text(
              'SignIn',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
