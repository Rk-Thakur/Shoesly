import 'package:equatable/equatable.dart';

import 'package:shoesly/features/discover_screen/domain/entities/product_entity.dart';

enum ProductListStatus { intial, loading, fetched, failure }

class DiscoverScreenState extends Equatable {
  final ProductListStatus productListStatus;
  final List<ProductEntity> productList;
  final String message;
  const DiscoverScreenState({
    this.productListStatus = ProductListStatus.intial,
    this.productList = const [],
    this.message = '',
  });

  @override
  List<Object?> get props => [productList, productListStatus, message];

  DiscoverScreenState copyWith({
    ProductListStatus? productListStatus,
    List<ProductEntity>? productList,
    String? message,
  }) {
    return DiscoverScreenState(
      productListStatus: productListStatus ?? this.productListStatus,
      productList: productList ?? this.productList,
      message: message ?? this.message,
    );
  }
}
