import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;

      default:
        throw UnsupportedError('Unsupported platform');
    }
  }

  // Firebase options for web
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyDfmqf0c4QbEpDdcoGp0nWRAD-6AOn00Rk", // Your web API key
    authDomain: "ammar1.firebaseapp.com",
    projectId: "ammar1",
    storageBucket: "ammar1.appspot.com",
    appId: '1:939672197347:android:a8fef82110b6291d8b4dd6',
    messagingSenderId: '939672197347',
  );

  // Firebase options for Android
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: "AIzaSyDfmqf0c4QbEpDdcoGp0nWRAD-6AOn00Rk",
    appId: "1:939672197347:android:a8fef82110b6291d8b4dd6",
    projectId: "ammar1",
    storageBucket: "ammar1.appspot.com",
    messagingSenderId: '939672197347',
  );

}
