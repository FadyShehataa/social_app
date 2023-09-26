import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:social_app/Features/Auth/presentation/views/widgets/register_header_section.dart';
import 'package:social_app/Features/Auth/presentation/views/widgets/register_to_login_section.dart';
import 'package:social_app/Features/Auth/presentation/views/widgets/register_button_section.dart';
import 'package:social_app/Features/Auth/presentation/views/widgets/register_form_section.dart';

import '../../../../../Core/utils/functions/show_snack_bar.dart';
import '../../manager/register_cubit/register_cubit.dart';

class RegisterViewBody extends StatelessWidget {
  RegisterViewBody({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          isLoading = true;
        } else if (state is RegisterSuccessState) {
          isLoading = false;
          // TODO navigate to home screen
        } else if (state is RegisterFailureState) {
          isLoading = false;
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const RegisterHeaderSection(),
                      const SizedBox(height: 30),
                      RegisterFormSection(
                        emailController: emailController,
                        passwordController: passwordController,
                      ),
                      const SizedBox(height: 30),
                      RegisterButtonSection(
                        emailController: emailController,
                        passwordController: passwordController,
                        formKey: formKey,
                      ),
                      const SizedBox(height: 20),
                      const RegisterToLoginSection(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
