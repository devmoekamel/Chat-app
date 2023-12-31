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
    apiKey: 'AIzaSyB81bvWJxyQQi9V80nkwHnZtj3-je9n4bU',
    appId: '1:642360456195:web:80fc7c34aeab1373a64a36',
    messagingSenderId: '642360456195',
    projectId: 'chat-app-89102',
    authDomain: 'chat-app-89102.firebaseapp.com',
    storageBucket: 'chat-app-89102.appspot.com',
    measurementId: 'G-8LCV3ENR5B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHIxTE8DS8SJMv01kE86xHD5yo8xAZIlY',
    appId: '1:642360456195:android:4eaf10fec03819e0a64a36',
    messagingSenderId: '642360456195',
    projectId: 'chat-app-89102',
    storageBucket: 'chat-app-89102.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDW9F4Z1Cx98NoJeJ5HjbO5_IRzLSIbLqQ',
    appId: '1:642360456195:ios:b51926b54f85fbb0a64a36',
    messagingSenderId: '642360456195',
    projectId: 'chat-app-89102',
    storageBucket: 'chat-app-89102.appspot.com',
    iosClientId: '642360456195-3kuuhoocmf9rrf9lnq27gduu328s3h7r.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDW9F4Z1Cx98NoJeJ5HjbO5_IRzLSIbLqQ',
    appId: '1:642360456195:ios:b51926b54f85fbb0a64a36',
    messagingSenderId: '642360456195',
    projectId: 'chat-app-89102',
    storageBucket: 'chat-app-89102.appspot.com',
    iosClientId: '642360456195-3kuuhoocmf9rrf9lnq27gduu328s3h7r.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );
}
