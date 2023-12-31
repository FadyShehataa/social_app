// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCXm4P4xzNW_ymnDgvZtMm1qp6zDuEPtg8',
    appId: '1:868019400409:web:8106ac27be05044b9c18c8',
    messagingSenderId: '868019400409',
    projectId: 'social-app-ff9b0',
    authDomain: 'social-app-ff9b0.firebaseapp.com',
    storageBucket: 'social-app-ff9b0.appspot.com',
    measurementId: 'G-FSSCLG0BVV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPU4CCtKfV2EnTCj9C5ToKreYoGMVG9MM',
    appId: '1:868019400409:android:a6f310315fa0c9929c18c8',
    messagingSenderId: '868019400409',
    projectId: 'social-app-ff9b0',
    storageBucket: 'social-app-ff9b0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2DDXEBNFoFkytRbmBHtbknoyI9KHkvq4',
    appId: '1:868019400409:ios:e7292d3304ac99dc9c18c8',
    messagingSenderId: '868019400409',
    projectId: 'social-app-ff9b0',
    storageBucket: 'social-app-ff9b0.appspot.com',
    iosBundleId: 'com.example.socialApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2DDXEBNFoFkytRbmBHtbknoyI9KHkvq4',
    appId: '1:868019400409:ios:875d6d7e4d7ff5ca9c18c8',
    messagingSenderId: '868019400409',
    projectId: 'social-app-ff9b0',
    storageBucket: 'social-app-ff9b0.appspot.com',
    iosBundleId: 'com.example.socialApp.RunnerTests',
  );
}
