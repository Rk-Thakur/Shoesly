import 'package:dartz/dartz.dart';
import 'package:shoesly/features/discover_screen/domain/entities/product_entity.dart';
import 'package:shoesly/features/discover_screen/domain/repositories/discover_repo.dart';
import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';
import 'package:shoesly_core/usecases/shoesly_usecase.dart';

class ProductListBrandUsecase
    implements ShoeslyUseCase<List<ProductEntity>, BrandNameParams> {
  late DiscoverRepository _discoverRepository;
  ProductListBrandUsecase({
    required DiscoverRepository discoverRepository,
  }) {
    _discoverRepository = discoverRepository;
  }
  @override
  Future<Either<Failure, List<ProductEntity>>> call(BrandNameParams params) {
    return _discoverRepository.getBrandProductList(brandNameParams: params);
  }
}
