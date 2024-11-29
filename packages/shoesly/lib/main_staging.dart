// Copyright (c) 2023. The Shoesly Authors. All rights reserved.

import 'package:device_preview/device_preview.dart';
import 'package:shoesly/core/injector/service_locator.dart';
import 'package:shoesly/core/widgets/error_widget.dart';
import 'package:shoesly/env.dart';
import 'package:shoesly/main.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  //Setup for the enviroment
  AppEnviroment.setUpEnv(Flavor.staging);
  setUpServiceLocator();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

  runApp(DevicePreview(
    backgroundColor: Colors.white,

    enabled: true,

    defaultDevice: Devices.ios.iPhone13ProMax,

    isToolbarVisible: true,

    tools: const [
      // Device selection controls
      DeviceSection(
        model: true, // Option to change device model to fit your needs
        orientation: false, // Lock to portrait for consistent demo
        frameVisibility: false, // Hide frame options
        virtualKeyboard: false, // Hide keyboard
      ),

      // Theme switching section
      // SystemSection(
      //   locale: false, // Hide language options - we're keeping it English only
      //   theme: false, // Show theme switcher if your app has dark/light modes
      // ),

      // Disable accessibility for demo simplicity
      // AccessibilitySection(
      //   boldText: false,
      //   invertColors: false,
      //   textScalingFactor: false,
      //   accessibleNavigation: false,
      // ),

      // Hide extra settings to keep demo focused
      // SettingsSection(
      //   backgroundTheme: false,
      //   toolsTheme: false,
      // ),
    ],

    // Curated list of devices for comprehensive preview
    devices: [
      // Popular Android Devices
      Devices.android.samsungGalaxyA50, // Mid-range
      Devices.android.samsungGalaxyNote20, // Large screen
      Devices.android.samsungGalaxyS20, // Flagship
      Devices.android.samsungGalaxyNote20Ultra, // Premium
      Devices.android.onePlus8Pro, // Different aspect ratio
      Devices.android.sonyXperia1II, // Tall screen

      // Popular iOS Devices
      Devices.ios.iPhoneSE, // Small screen
      Devices.ios.iPhone12, // Standard size
      Devices.ios.iPhone12Mini, // Compact
      Devices.ios.iPhone12ProMax, // Large
      Devices.ios.iPhone13, // Latest standard
      Devices.ios.iPhone13ProMax, // Latest large
      Devices.ios.iPhone13Mini, // Latest compact
      Devices.ios.iPhoneSE, // Budget option
    ],
    builder: (context) => const ShoeslyApp(),
  ));
}
