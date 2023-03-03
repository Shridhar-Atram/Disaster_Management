// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
//import 'firebase_options.dart';
// ignore: non_constant_identifier_names
/// // ...

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
    apiKey: 'AIzaSyAQRyHGYukMFzWHjVcLNs39DTXLWRRdRLw',
    appId: '1:1051444101684:web:3f039a04a5cc361c38c061',
    messagingSenderId: '1051444101684',
    projectId: 'gdscdisastermanagement-b0373',
    authDomain: 'gdscdisastermanagement-b0373.firebaseapp.com',
    databaseURL:
        'https://gdscdisastermanagement-b0373-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'gdscdisastermanagement-b0373.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2LG3jF__uZlVZlHc47qxO0N7jNBnPBBg',
    appId: '1:1051444101684:android:5f4f880cfbf0e7d838c061',
    messagingSenderId: '1051444101684',
    projectId: 'gdscdisastermanagement-b0373',
    databaseURL:
        'https://gdscdisastermanagement-b0373-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'gdscdisastermanagement-b0373.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8YBTBttEwk0DbkGts3npXOsC28PgYQiE',
    appId: '1:1051444101684:ios:ef2aa4cdea1c119238c061',
    messagingSenderId: '1051444101684',
    projectId: 'gdscdisastermanagement-b0373',
    databaseURL:
        'https://gdscdisastermanagement-b0373-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'gdscdisastermanagement-b0373.appspot.com',
    iosClientId:
        '1051444101684-43np8hgnm46hatpvck66dh6oijblrv3h.apps.googleusercontent.com',
    iosBundleId: 'com.example.disasterManagement',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8YBTBttEwk0DbkGts3npXOsC28PgYQiE',
    appId: '1:1051444101684:ios:ef2aa4cdea1c119238c061',
    messagingSenderId: '1051444101684',
    projectId: 'gdscdisastermanagement-b0373',
    databaseURL:
        'https://gdscdisastermanagement-b0373-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'gdscdisastermanagement-b0373.appspot.com',
    iosClientId:
        '1051444101684-43np8hgnm46hatpvck66dh6oijblrv3h.apps.googleusercontent.com',
    iosBundleId: 'com.example.disasterManagement',
  );
}
