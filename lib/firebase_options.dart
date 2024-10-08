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
        return ios;
      case TargetPlatform.macOS:
        return macos;
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
    apiKey: 'AIzaSyDb6HSt4sJEEoFpseAk2-G6yZAu0WrpHa0',
    appId: '1:96710872758:web:dc97c152fb83cb6127e017',
    messagingSenderId: '96710872758',
    projectId: 'chatapp-f912d',
    authDomain: 'chatapp-f912d.firebaseapp.com',
    storageBucket: 'chatapp-f912d.appspot.com',
    measurementId: 'G-EW8N7CDKHC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxyc6PDB7xo4Dra9r4ejkmI3qxyriz4iE',
    appId: '1:96710872758:android:79af5d629863dc8b27e017',
    messagingSenderId: '96710872758',
    projectId: 'chatapp-f912d',
    storageBucket: 'chatapp-f912d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA2SEhHG40G_katP-9pxW3XAZKzrWmYdLE',
    appId: '1:96710872758:ios:46340633fcd803a527e017',
    messagingSenderId: '96710872758',
    projectId: 'chatapp-f912d',
    storageBucket: 'chatapp-f912d.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA2SEhHG40G_katP-9pxW3XAZKzrWmYdLE',
    appId: '1:96710872758:ios:46340633fcd803a527e017',
    messagingSenderId: '96710872758',
    projectId: 'chatapp-f912d',
    storageBucket: 'chatapp-f912d.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDb6HSt4sJEEoFpseAk2-G6yZAu0WrpHa0',
    appId: '1:96710872758:web:e2d043aba76b49f527e017',
    messagingSenderId: '96710872758',
    projectId: 'chatapp-f912d',
    authDomain: 'chatapp-f912d.firebaseapp.com',
    storageBucket: 'chatapp-f912d.appspot.com',
    measurementId: 'G-SD0RW6FH8P',
  );
}
