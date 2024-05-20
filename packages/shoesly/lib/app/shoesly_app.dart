// Copyright (c) 2024. The Shoesly Authors. All rights reserved.

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
            debugShowCheckedModeBanner: false,
            onGenerateTitle: (context) => '',
            title: 'Shoesly',
            theme: ThemeData(
                useMaterial3: true,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.black,
                ),
                textTheme: GoogleFonts.urbanistTextTheme(
                  Theme.of(context).textTheme,
                ),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                )),
                sliderTheme: const SliderThemeData(
                  thumbColor: Colors.black,
                  activeTrackColor: Colors.black,
                )),
            onGenerateRoute: ShoeslyRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
