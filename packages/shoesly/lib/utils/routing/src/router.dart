import 'package:flutter/material.dart';
import 'package:shoesly/features/cart_screen/pages/cart_screen.dart';
import 'package:shoesly/features/discover_screen/pages/discover_screen.dart';
import 'package:shoesly/features/order_summary/pages/order_summary.dart';
import 'package:shoesly/features/product_detail_screen/pages/product_detail_screen.dart';
import 'package:shoesly/features/product_filter_screen/pages/product_filter_screen.dart';
import 'package:shoesly/features/product_review_screen/pages/product_review_screen.dart';
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
      case ShoeslyRoutes.productDetailScreen:
        return MaterialPageRoute(builder: (_) {
          return const ProductDetailScreen();
        });
      case ShoeslyRoutes.productFilterScreen:
        return MaterialPageRoute(builder: (_) {
          return const ProductFilterScreen();
        });
      case ShoeslyRoutes.productReviewScreen:
        return MaterialPageRoute(builder: (_) {
          return const ProductReviewScreen();
        });
      case ShoeslyRoutes.cartScreen:
        return MaterialPageRoute(builder: (_) {
          return const CartScreen();
        });
      case ShoeslyRoutes.orderSummary:
        return MaterialPageRoute(builder: (_) {
          return const OrderSummary();
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
