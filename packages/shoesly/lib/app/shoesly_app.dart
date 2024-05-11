// Copyright (c) 2024. The Shoesly Authors. All rights reserved.

import 'package:shoesly/main.g.dart';

class ShoeslyApp extends StatelessWidget {
  const ShoeslyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 872),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) => '',
          title: 'Shoesly',
          theme: ThemeData(
            useMaterial3: true,
            // colorScheme: LearningTheme.lightColorScheme,
            // textTheme: LearningFont.lightTextTheme,
          ),
          onGenerateRoute: ShoeslyRouter.onGenerateRoute,
        );
      },
    );
  }
}
