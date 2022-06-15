// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    databaseURL: 'https://pharmacycatalogdemo-default-rtdb.asia-southeast1.firebasedatabase.app/',
    apiKey: 'AIzaSyBdcqInrQdkCiWZoPQRHhM2U2ug10FBf4s',
    appId: '1:428380647444:web:1159007d926d7ad44cb701',
    messagingSenderId: '428380647444',
    projectId: 'pharmacycatalogdemo',
    authDomain: 'pharmacycatalogdemo.firebaseapp.com',
    storageBucket: 'pharmacycatalogdemo.appspot.com',
    measurementId: 'G-XSF1XPW08D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    
    apiKey: 'AIzaSyCFMMW3T6NFj1G4tWQY-NRJA4anQOqK4MI',
    appId: '1:428380647444:android:3974189cc8d286604cb701',
    messagingSenderId: '428380647444',
    projectId: 'pharmacycatalogdemo',
    storageBucket: 'pharmacycatalogdemo.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAiq3lE2HB-wTXEio2830l9aoXDk6zvnb0',
    appId: '1:428380647444:ios:f7068e5dd424da904cb701',
    messagingSenderId: '428380647444',
    projectId: 'pharmacycatalogdemo',
    storageBucket: 'pharmacycatalogdemo.appspot.com',
    iosClientId: '428380647444-2lt096erj7hurg45irr62qs55cmuf6r8.apps.googleusercontent.com',
    iosBundleId: 'com.pharmacycatalog.app',
  );
}
