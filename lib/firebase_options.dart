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
    apiKey: 'AIzaSyA_CM4SQO4SoOsH8gmMq8StlRzDAXrdHxY',
    appId: '1:444072048287:web:b6eb9ef9539ff196d754aa',
    messagingSenderId: '444072048287',
    projectId: 'wallet-6dd26',
    authDomain: 'wallet-6dd26.firebaseapp.com',
    storageBucket: 'wallet-6dd26.appspot.com',
    measurementId: 'G-HGM5G8H5X3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1dHTd0LSj1swRQlYmCq701mA3hW5AUrM',
    appId: '1:444072048287:android:8dba74dacdb457eed754aa',
    messagingSenderId: '444072048287',
    projectId: 'wallet-6dd26',
    storageBucket: 'wallet-6dd26.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7-EfaqhjVPyYodAZ6B3lWu-5i8uZOwuI',
    appId: '1:444072048287:ios:407afb7594e5b955d754aa',
    messagingSenderId: '444072048287',
    projectId: 'wallet-6dd26',
    storageBucket: 'wallet-6dd26.appspot.com',
    iosBundleId: 'com.example.wallet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7-EfaqhjVPyYodAZ6B3lWu-5i8uZOwuI',
    appId: '1:444072048287:ios:9cbfc4b825fbfd96d754aa',
    messagingSenderId: '444072048287',
    projectId: 'wallet-6dd26',
    storageBucket: 'wallet-6dd26.appspot.com',
    iosBundleId: 'com.example.wallet.RunnerTests',
  );
}
