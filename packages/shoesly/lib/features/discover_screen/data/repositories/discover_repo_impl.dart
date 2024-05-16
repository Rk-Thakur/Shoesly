// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:shoesly/features/discover_screen/data/datasources/discover_remote_data_sources.dart';
import 'package:shoesly/features/discover_screen/domain/entities/product_entity.dart';
import 'package:shoesly/features/discover_screen/domain/repositories/discover_repo.dart';
import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';

class DiscoverRepoImpl extends DiscoverRepository {
  late DiscoverRemoteDataSources _discoverRemoteDataSources;
  DiscoverRepoImpl({
    required DiscoverRemoteDataSources discoverRemoteDataSources,
  }) {
    _discoverRemoteDataSources = discoverRemoteDataSources;
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductList() {
    return _discoverRemoteDataSources.getProductList(noParams: NoParams());
  }
}
