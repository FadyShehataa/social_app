import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_app/Core/utils/constants.dart';
import 'package:social_app/Core/utils/my_colors.dart';

import 'Core/utils/app_router.dart';
import 'Core/utils/cache_network.dart';
import 'Core/utils/service_locator.dart';
import 'firebase_options.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheNetwork.cacheInitialization();
  uId = await CacheNetwork.getCacheData(key: 'uId');
  runApp(
    DevicePreview(
      builder: (context) => const SocialApp(),
    ),
  );
}

class SocialApp extends StatelessWidget {
  const SocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: DevicePreview.appBuilder,
      routerConfig: AppRouter.router,
      theme: ThemeData.dark().copyWith(
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: MyColors.myAquamarine,
          elevation: 50,
          backgroundColor: Color.fromARGB(255, 0, 35, 62),
        ),
        scaffoldBackgroundColor: MyColors.myDarkCerulean,
      ),
    );
  }
}
