import 'package:shoesly/features/authentication/presentation/pages/login_screen.dart';
import 'package:shoesly/features/cart_screen/presentation/pages/cart_screen.dart';
import 'package:shoesly/features/discover_screen/presentation/pages/discover_screen.dart';

import 'package:shoesly/features/form_screen/presentation/pages/form_screen.dart';
import 'package:shoesly/features/order_summary/presentation/pages/order_summary.dart';
import 'package:shoesly/features/product_detail_screen/presentation/pages/product_detail_screen.dart';
import 'package:shoesly/features/product_review_screen/pages/product_review_screen.dart';
import 'package:shoesly/features/splash_screen/presentation/pages/splash_screen.dart';
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
        if (args is ReviewParams) {
          return MaterialPageRoute(builder: (_) {
            return ProductReviewScreen(
              reviewParams: args,
            );
          });
        }
        return notFoundRoute();

      case ShoeslyRoutes.cartScreen:
        return MaterialPageRoute(builder: (_) {
          return const CartScreen();
        });
      case ShoeslyRoutes.orderSummary:
        if (args is OrderSummaryParams) {
          return MaterialPageRoute(builder: (_) {
            return OrderSummary(
              orderSummaryParams: args,
            );
          });
        }
        return notFoundRoute();

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
