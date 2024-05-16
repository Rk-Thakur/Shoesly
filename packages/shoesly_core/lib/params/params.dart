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
  FormParams({
    required this.images,
    required this.productName,
    required this.sizes,
    required this.description,
    required this.price,
    required this.productId,
  });
}
