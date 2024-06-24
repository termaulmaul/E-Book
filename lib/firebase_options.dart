// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAv3c_-xR0Y0iS2HTdZsrFrij8K3zhk5e4',
    appId: '1:117588965381:web:0a08a6dfb108cc6563846c',
    messagingSenderId: '117588965381',
    projectId: 'ebook-e32f5',
    authDomain: 'ebook-e32f5.firebaseapp.com',
    storageBucket: 'ebook-e32f5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3vWL5f9Hv54C_h_b-VIHdHSqX4LIBaug',
    appId: '1:117588965381:android:5fcf7fbffdc096d363846c',
    messagingSenderId: '117588965381',
    projectId: 'ebook-e32f5',
    storageBucket: 'ebook-e32f5.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAv3c_-xR0Y0iS2HTdZsrFrij8K3zhk5e4',
    appId: '1:117588965381:web:4952fd762054f58963846c',
    messagingSenderId: '117588965381',
    projectId: 'ebook-e32f5',
    authDomain: 'ebook-e32f5.firebaseapp.com',
    storageBucket: 'ebook-e32f5.appspot.com',
  );

}