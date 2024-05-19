import 'package:dartz/dartz.dart';
import 'package:shoesly/features/discover_screen/domain/entities/product_entity.dart';
import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';

abstract class DiscoverRepository {
  Future<Either<Failure, List<ProductEntity>>> getProductList();
  Future<Either<Failure, List<ProductEntity>>> getBrandProductList(
      {required BrandNameParams brandNameParams});
}
