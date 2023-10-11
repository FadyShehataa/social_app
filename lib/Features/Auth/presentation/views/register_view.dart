import 'package:flutter/material.dart';
import 'package:social_app/Features/Auth/presentation/views/widgets/register_view_body.dart';

import '../../../../Core/utils/my_colors.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
          child: RegisterViewBody(),
        ),
      ),
    );
  }
}
