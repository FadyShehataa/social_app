import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:social_app/Core/utils/cache_network.dart';
import 'package:social_app/Core/utils/constants.dart';
import 'package:social_app/Features/Auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:social_app/Features/Auth/presentation/views/widgets/login_form_section.dart';
import 'package:social_app/Features/Auth/presentation/views/widgets/login_header_section.dart';
import 'package:social_app/Features/Auth/presentation/views/widgets/login_to_register_section.dart';

import '../../../../../Core/utils/app_router.dart';
import '../../../../../Core/utils/functions/show_snack_bar.dart';
import 'login_button_section.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginLoadingState) {
          isLoading = true;
        } else if (state is LoginSuccessState) {
          isLoading = false;
          CacheNetwork.insertToCache(key: 'uId', value: state.uId);
          uId = state.uId;
          GoRouter.of(context).go(AppRouter.kHomeView);
        } else if (state is LoginFailureState) {
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
                      const LoginHeaderSection(),
                      const SizedBox(height: 30),
                      LoginFormSection(
                        emailController: emailController,
                        passwordController: passwordController,
                      ),
                      const SizedBox(height: 30),
                      LoginButtonSection(
                        emailController: emailController,
                        passwordController: passwordController,
                        formKey: formKey,
                      ),
                      const SizedBox(height: 20),
                      const LoginToRegisterSection(),
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
