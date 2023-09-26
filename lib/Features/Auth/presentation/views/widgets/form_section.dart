import 'package:flutter/material.dart';

import '../../../../../Core/widgets/custom_text_form_field.dart';
import '../../manager/login_cubit/login_cubit.dart';

class FormSection extends StatelessWidget {
  FormSection(
      {super.key,
      required this.emailController,
      required this.passwordController});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: emailController,
          hintText: 'Email Address',
          prefixIcon: const Icon(Icons.email_outlined),
          validatorMessage: 'Email Address is required',
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          controller: passwordController,
          hintText: 'Password',
          prefixIcon: const Icon(Icons.lock_outline),
          validatorMessage: 'Password is required',
          suffixIcon: IconButton(
            onPressed: () {
              // TODO : fix change password visibility
              LoginCubit.get(context).changePasswordVisibility();
            },
            icon: Icon(LoginCubit.get(context).suffixIcon),
          ),
          obscureText: LoginCubit.get(context).isPassword,
        ),
      ],
    );
  }
}
