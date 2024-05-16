// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:shoesly/features/discover_screen/domain/entities/product_entity.dart';
import 'package:shoesly/features/discover_screen/domain/repositories/discover_repo.dart';
import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';
import 'package:shoesly_core/usecases/shoesly_usecase.dart';

class ProductListUseCase implements ShoeslyUseCase<List<ProductEntity>, NoParams> {
  late DiscoverRepository _discoverRepository;
  ProductListUseCase({
    required DiscoverRepository discoverRepository,
  }) {
    _discoverRepository = discoverRepository;
  }
  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) {
    return _discoverRepository.getProductList();
  }
}
