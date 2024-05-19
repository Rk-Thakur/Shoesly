// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductDetailParams {
  final List<String> imageList;
  final List<double> size;
  final String productDescription;
  final String productName;
  final String productId;
  final int price;
  ProductDetailParams({
    required this.imageList,
    required this.size,
    required this.productDescription,
    required this.productName,
    required this.productId,
    required this.price,
  });
}
