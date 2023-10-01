import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/register_cubit/register_cubit.dart';

class RegisterButtonSection extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final TextEditingController nameController;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RegisterButtonSection({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
    required this.phoneController,
    required this.nameController,
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
                await BlocProvider.of<RegisterCubit>(context).userRegister(
                  email: emailController.text,
                  password: passwordController.text,
                  name: nameController.text,
                  phone: phoneController.text,
                );
              }
            },
            child: const Text(
              'Register',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
