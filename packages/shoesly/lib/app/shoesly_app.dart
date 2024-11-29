// Copyright (c) 2024. The Shoesly Authors. All rights reserved.

import 'package:device_preview/device_preview.dart';
import 'package:shoesly/env.dart';
import 'package:shoesly/main.g.dart';

class ShoeslyApp extends StatelessWidget {
  const ShoeslyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: ShoeslyBlocProvider.providers,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            navigatorObservers: [
              LoggerNavigationServiceObserver(),
            ],
            debugShowCheckedModeBanner: false,
            builder: DevicePreview.appBuilder,
            onGenerateTitle: (context) => '',
            title: 'Shoesly',
            theme: ThemeData(
              useMaterial3: true,
              primarySwatch: AppEnviroment.primarySwatch,
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: AppEnviroment.primarySwatch,
              ),
              textTheme: GoogleFonts.urbanistTextTheme(
                Theme.of(context).textTheme,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: AppEnviroment.primarySwatch,
                ),
              ),
              sliderTheme: SliderThemeData(
                thumbColor: AppEnviroment.primarySwatch,
                activeTrackColor: AppEnviroment.primarySwatch,
              ),
            ),
            onGenerateRoute: ShoeslyRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
