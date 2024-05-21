import 'package:shoesly/features/cart_screen/domain/entities/cart_list_entity.dart';

class OrderSummaryParams {
  final List<CartEntity> cartList;
  final int grandTotal;
  OrderSummaryParams({
    required this.cartList,
    required this.grandTotal,
  });
}
