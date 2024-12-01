import 'package:shoesly/main.g.dart';

class FirebaseConfigOptions {
  static FirebaseOptions get productionPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return ProductionFirebaseOptions.productionAndroid;
      case TargetPlatform.iOS:
        return ProductionFirebaseOptions.productionIos;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static FirebaseOptions get developmentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return DevelopmentFirebaseOptions.developmentAndroid;
      case TargetPlatform.iOS:
        return DevelopmentFirebaseOptions.developmentIos;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static FirebaseOptions get stagingPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return StagingFirebaseOptions.stagingAndroid;
      case TargetPlatform.iOS:
        return StagingFirebaseOptions.stagingIos;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }
}

class ProductionFirebaseOptions {
  static const FirebaseOptions productionAndroid = FirebaseOptions(
    apiKey: 'AIzaSyBRstBi_PoRTMy1W5ZuDA30nIyg_TyR0JE',
    appId: '1:221008838901:android:9c187fa334799f143305bc',
    messagingSenderId: '221008838901',
    projectId: 'shoesly-77d25',
    storageBucket: 'shoesly-77d25.appspot.com',
  );

  static const FirebaseOptions productionIos = FirebaseOptions(
    apiKey: 'AIzaSyBpkFtQzTa-0NR4ZE0Kd1QrqRSx7QifmRc',
    appId: '1:221008838901:ios:9453636a59cbe1763305bc',
    messagingSenderId: '221008838901',
    projectId: 'shoesly-77d25',
    storageBucket: 'shoesly-77d25.appspot.com',
    iosBundleId: 'com.example.shoesly',
  );
}

class DevelopmentFirebaseOptions {
  static const FirebaseOptions developmentAndroid = FirebaseOptions(
    apiKey: 'AIzaSyBRstBi_PoRTMy1W5ZuDA30nIyg_TyR0JE',
    appId: '1:221008838901:android:d1b0c8cb4f1325f13305bc',
    messagingSenderId: '221008838901',
    projectId: 'shoesly-77d25',
    storageBucket: 'shoesly-77d25.appspot.com',
  );

  static const FirebaseOptions developmentIos = FirebaseOptions(
    apiKey: 'AIzaSyBpkFtQzTa-0NR4ZE0Kd1QrqRSx7QifmRc',
    appId: '1:221008838901:ios:9453636a59cbe1763305bc',
    messagingSenderId: '221008838901',
    projectId: 'shoesly-77d25',
    storageBucket: 'shoesly-77d25.appspot.com',
    iosBundleId: 'com.example.shoesly',
  );
}

class StagingFirebaseOptions {
  static const FirebaseOptions stagingAndroid = FirebaseOptions(
    apiKey: 'AIzaSyBRstBi_PoRTMy1W5ZuDA30nIyg_TyR0JE',
    appId: '1:221008838901:android:2c45ab416a0f984c3305bc',
    messagingSenderId: '221008838901',
    projectId: 'shoesly-77d25',
    storageBucket: 'shoesly-77d25.appspot.com',
  );

  static const FirebaseOptions stagingIos = FirebaseOptions(
    apiKey: 'AIzaSyBpkFtQzTa-0NR4ZE0Kd1QrqRSx7QifmRc',
    appId: '1:221008838901:ios:9453636a59cbe1763305bc',
    messagingSenderId: '221008838901',
    projectId: 'shoesly-77d25',
    storageBucket: 'shoesly-77d25.appspot.com',
    iosBundleId: 'com.example.shoesly',
  );
}
