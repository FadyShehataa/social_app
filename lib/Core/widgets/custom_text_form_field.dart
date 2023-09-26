import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.validatorMessage,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String? hintText;
  final String? validatorMessage;
  Widget? suffixIcon;
  final Widget? prefixIcon;
  bool obscureText;

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
      obscureText: obscureText,
    );
  }
}
