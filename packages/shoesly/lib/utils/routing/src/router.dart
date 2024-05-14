import 'package:shoesly/features/product_review_screen/pages/product_review_screen.dart';
import 'package:shoesly/main.g.dart';

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
