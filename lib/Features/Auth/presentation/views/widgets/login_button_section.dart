import 'package:flutter/material.dart';
import 'package:social_app/Features/Auth/presentation/manager/login_cubit/login_cubit.dart';

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
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                LoginCubit.get(context).userLogin(
                  email: emailController.text,
                  password: passwordController.text,
                );
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
