import 'package:flutter/material.dart';
import 'package:social_app/Features/Splash/presentation/views/widgets/splash_view_body.dart';

import '../../../../Core/utils/my_colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SplashViewBody(),
      ),
    );
  }
}
