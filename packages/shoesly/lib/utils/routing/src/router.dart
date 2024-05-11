import 'package:flutter/material.dart';
import 'package:shoesly/features/discover_screen/pages/discover_screen.dart';
import 'package:shoesly/features/splash_screen/pages/splash_screen.dart';
import 'package:shoesly/utils/routing/routing.dart';

class ShoeslyRouter {
  ShoeslyRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    // final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case ShoeslyRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) {
          return const SplashScreen();
        });
      case ShoeslyRoutes.discoverScreen:
        return MaterialPageRoute(builder: (_) {
          return const DiscoverScreen();
        });
      default:
        return notFoundRoute();
    }
  }

  static Route notFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => const Material(
        child: Scaffold(
          body: Center(child: Text('Page Not Found')),
        ),
      ),
    );
  }
}
