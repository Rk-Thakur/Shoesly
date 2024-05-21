import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final List<String> productImage;
  final String productName;
  final int productPrice;
  final String productDescription;
  final List<double> productSize;
  final String productId;
  final String brandName;
  const ProductEntity({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productSize,
    required this.productId,
    required this.brandName,
  });

  @override
  List<Object?> get props => [
        productImage,
        productName,
        productPrice,
        productDescription,
        productSize,
        productId,
      ];
}
