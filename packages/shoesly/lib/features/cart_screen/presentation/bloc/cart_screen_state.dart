import 'package:equatable/equatable.dart';

import 'package:shoesly/features/cart_screen/domain/entities/cart_list_entity.dart';

enum CartStatus { initial, loading, added, fetched, failure }

class CartScreenState extends Equatable {
  final CartStatus cartStatus;
  final String message;
  final List<CartEntity> cartList;
  const CartScreenState({
    this.cartStatus = CartStatus.initial,
    this.message = '',
    this.cartList = const [],
  });
  @override
  List<Object?> get props => [
        cartStatus,
        message,
        cartList,
      ];

  CartScreenState copyWith({
    CartStatus? cartStatus,
    String? message,
    List<CartEntity>? cartList,
  }) {
    return CartScreenState(
      cartStatus: cartStatus ?? this.cartStatus,
      message: message ?? this.message,
      cartList: cartList ?? this.cartList,
    );
  }
}
