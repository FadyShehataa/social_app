import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'login now to communicate with friends',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
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
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_outlined),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(14),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
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
                    onPressed: () {},
                    child: const Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.validatorMessage,
    this.suffixIcon,
    this.prefixIcon,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? validatorMessage;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return validatorMessage;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(20),
        border: const OutlineInputBorder(),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
