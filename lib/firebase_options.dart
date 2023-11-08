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
    apiKey: 'AIzaSyCceoPMwQIE4-desTzAvHM5_i2kz-z3wiw',
    appId: '1:684459689725:web:57365f6dc8af54ccfd2094',
    messagingSenderId: '684459689725',
    projectId: 'moyo-wedding-app-e8b92',
    authDomain: 'moyo-wedding-app-e8b92.firebaseapp.com',
    databaseURL: 'https://moyo-wedding-app-e8b92-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'moyo-wedding-app-e8b92.appspot.com',
    measurementId: 'G-R68WQ5JWJ1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBj6VUW54MH0iFNu2h-ErEaxh11_2Ka4Xk',
    appId: '1:684459689725:android:c92c324dd5acd299fd2094',
    messagingSenderId: '684459689725',
    projectId: 'moyo-wedding-app-e8b92',
    databaseURL: 'https://moyo-wedding-app-e8b92-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'moyo-wedding-app-e8b92.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDLiY7jWDdVDlz13qTDrZ4CxnZN2XJJSbk',
    appId: '1:684459689725:ios:02db528e1ed5c9a4fd2094',
    messagingSenderId: '684459689725',
    projectId: 'moyo-wedding-app-e8b92',
    databaseURL: 'https://moyo-wedding-app-e8b92-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'moyo-wedding-app-e8b92.appspot.com',
    iosBundleId: 'com.example.moyo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDLiY7jWDdVDlz13qTDrZ4CxnZN2XJJSbk',
    appId: '1:684459689725:ios:c77bee741d0e9426fd2094',
    messagingSenderId: '684459689725',
    projectId: 'moyo-wedding-app-e8b92',
    databaseURL: 'https://moyo-wedding-app-e8b92-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'moyo-wedding-app-e8b92.appspot.com',
    iosBundleId: 'com.example.moyo.RunnerTests',
  );
}
