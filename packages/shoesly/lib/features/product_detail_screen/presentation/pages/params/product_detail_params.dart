class ProductDetailParams {
  final List<String> imageList;
  final List<double> size;
  final String productDescription;
  final String productName;
  ProductDetailParams({
    required this.imageList,
    required this.size,
    required this.productDescription,
    required this.productName,
  });
}
