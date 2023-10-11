import 'package:flutter/material.dart';
import 'package:social_app/Core/utils/my_colors.dart';
import 'package:social_app/Features/Auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MyColors.myDarkCerulean.withOpacity(0.4),
              MyColors.myDarkCerulean,
              MyColors.myDarkGunmetal,
            ],
          ),
        ),
        child: SafeArea(
          child: LoginViewBody(),
        ),
      ),
    );
  }
}
