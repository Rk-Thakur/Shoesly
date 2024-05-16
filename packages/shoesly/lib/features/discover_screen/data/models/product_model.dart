import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/features/discover_screen/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.productImage,
    required super.productName,
    required super.productPrice,
    required super.productDescription,
    required super.productSize,
  });

  factory ProductModel.fromJson(DocumentSnapshot doc) {
    Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
    return ProductModel(
      productSize: List<double>.from(map['size']),
      productDescription: map['productDescription'],
      productImage: List<String>.from(map['productImage']),
      productName: map['productName'] as String,
      productPrice: map['price'] as int,
    );
  }
}
