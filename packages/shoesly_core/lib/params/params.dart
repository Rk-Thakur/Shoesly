// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_picker/image_picker.dart';

abstract class Params {}

class NoParams extends Params {}

class FormParams extends Params {
  final List<XFile> images;
  final String productName;
  final List<double> sizes;
  final String description;
  final int price;
  final int productId;
  final String brand;
  FormParams({
    required this.images,
    required this.productName,
    required this.sizes,
    required this.description,
    required this.price,
    required this.productId,
    required this.brand,
  });
}

class CommentParams extends Params {
  final String review;
  final int star;
  final String productId;

  CommentParams({
    required this.review,
    required this.star,
    required this.productId,
  });
}

class FetchCommentByProductIdParams extends Params {
  final String productId;
  FetchCommentByProductIdParams({
    required this.productId,
  });
}

class FetchCommentUnderStarsParams extends Params {
  final int stars;
  final String productId;
  FetchCommentUnderStarsParams({
    required this.stars,
    required this.productId,
  });
}

class BrandNameParams extends Params {
  String brandName;
  BrandNameParams({
    required this.brandName,
  });
}
