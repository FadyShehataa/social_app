import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:social_app/Features/Auth/presentation/views/widgets/form_section.dart';
import 'package:social_app/Features/Auth/presentation/views/widgets/header_section.dart';
import 'package:social_app/Features/Auth/presentation/views/widgets/register_section.dart';

import 'login_button_section.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const Text(
                    //   'LOGIN',
                    //   style: TextStyle(
                    //     fontSize: 34,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // const Text(
                    //   'login now to communicate with friends',
                    //   style: TextStyle(
                    //     fontSize: 16,
                    //     color: Colors.grey,
                    //   ),
                    // ),
                    const HeaderSection(),
                    const SizedBox(height: 30),
                    // CustomTextFormField(
                    //   controller: emailController,
                    //   hintText: 'Email Address',
                    //   prefixIcon: const Icon(Icons.email_outlined),
                    //   validatorMessage: 'Email Address is required',
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // CustomTextFormField(
                    //   controller: passwordController,
                    //   hintText: 'Password',
                    //   prefixIcon: const Icon(Icons.lock_outline),
                    //   validatorMessage: 'Password is required',
                    //   suffixIcon: IconButton(
                    //     onPressed: () {
                    //       // TODO : fix change password visibility
                    //       LoginCubit.get(context).changePasswordVisibility();
                    //     },
                    //     icon: Icon(LoginCubit.get(context).suffixIcon),
                    //   ),
                    //   obscureText: LoginCubit.get(context).isPassword,
                    // ),
                    FormSection(
                      emailController: emailController,
                      passwordController: passwordController,
                    ),
                    const SizedBox(height: 30),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: ElevatedButton(
                    //         style: ElevatedButton.styleFrom(
                    //           padding: const EdgeInsets.all(14),
                    //         ),
                    //         onPressed: () {
                    //           if (formKey.currentState!.validate()) {
                    //             // TODO: Login
                    //           }
                    //         },
                    //         child: const Text(
                    //           'LOGIN',
                    //           style: TextStyle(fontSize: 20),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    LoginButtonSection(
                      emailController: emailController,
                      passwordController: passwordController,
                      formKey: formKey,
                    ),
                    const SizedBox(height: 20),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     const Text(
                    //       'Don\'t have an account?',
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     TextButton(
                    //       onPressed: () {},
                    //       child: const Text(
                    //         'REGISTER',
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const RegisterSection(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
