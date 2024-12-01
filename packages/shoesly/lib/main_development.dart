// Copyright (c) 2023. The Shoesly Authors. All rights reserved.

import 'dart:developer';

import 'package:device_preview/device_preview.dart';
import 'package:shoesly/core/injector/service_locator.dart';
import 'package:shoesly/core/services/firebase_notification_services.dart';
import 'package:shoesly/core/widgets/error_widget.dart';
import 'package:shoesly/env.dart';
import 'package:shoesly/main.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  //Setup for the enviroment
  AppEnviroment.setUpEnv(Flavor.dev);
  setUpServiceLocator();

  await Firebase.initializeApp(
    options: FirebaseConfigOptions.developmentPlatform,
  );

  final options = Firebase.app().options;
  log('Firebase Project ID: ${options.projectId}');
  log('Firebase API Key: ${options.apiKey}');
  log('Firebase Detils ${options.toString()}');

  // Notification Service
  await FirebaseNotificationServices().initNotifications();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    runApp(ErrorWidgetClass(details));
  };

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);

  await Hive.openBox<bool>('onBoardBox');
  await TokenService().initializeHive();

  runApp(const ShoeslyApp());
}
