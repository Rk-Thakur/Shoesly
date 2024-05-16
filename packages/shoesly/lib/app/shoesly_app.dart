// Copyright (c) 2024. The Shoesly Authors. All rights reserved.

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/main.g.dart';
import 'package:shoesly/utils/shoesly_bloc_providers.dart';

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
            title: 'Learning Management System',
            theme: ThemeData(
              useMaterial3: true,
              // colorScheme: LearningTheme.lightColorScheme,
              // textTheme: LearningFont.lightTextTheme,
            ),
            onGenerateRoute: ShoeslyRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
