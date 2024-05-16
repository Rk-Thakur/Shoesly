import 'package:shoesly/features/authentication/presentation/pages/login_screen.dart';
import 'package:shoesly/features/discover_screen/presentation/pages/discover_screen.dart';

import 'package:shoesly/features/form_screen/presentation/pages/form_screen.dart';
import 'package:shoesly/features/product_detail_screen/presentation/pages/params/product_detail_params.dart';
import 'package:shoesly/features/product_detail_screen/presentation/pages/product_detail_screen.dart';
import 'package:shoesly/features/product_review_screen/pages/product_review_screen.dart';
import 'package:shoesly/main.g.dart';

class ShoeslyRouter {
  ShoeslyRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case ShoeslyRoutes.splashScreen:
        return MaterialPageRoute(builder: (_) {
          return const SplashScreen();
        });
      case ShoeslyRoutes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) {
          return const OnBoardingScreen();
        });
      case ShoeslyRoutes.loginScreen:
        return MaterialPageRoute(builder: (_) {
          return const LoginScreen();
        });
      case ShoeslyRoutes.discoverScreen:
        return MaterialPageRoute(builder: (_) {
          return const DiscoverScreen();
        });
      case ShoeslyRoutes.formScreen:
        return MaterialPageRoute(builder: (_) {
          return const FormScreen();
        });
      case ShoeslyRoutes.productDetailScreen:
        if (args is ProductDetailParams) {
          return MaterialPageRoute(builder: (_) {
            return ProductDetailScreen(
              productDetailParams: args,
            );
          });
        }
        return notFoundRoute();
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
