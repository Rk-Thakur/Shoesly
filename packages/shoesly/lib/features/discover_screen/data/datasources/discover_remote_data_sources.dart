import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:shoesly/features/discover_screen/data/models/product_model.dart';
import 'package:shoesly/main.g.dart';
import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';

abstract class DiscoverRemoteDataSources {
  Future<Either<Failure, List<ProductModel>>> getProductList({required NoParams noParams});
}

class DiscoverRemoteDataSourcesImpl extends DiscoverRemoteDataSources {
  @override
  Future<Either<Failure, List<ProductModel>>> getProductList({required NoParams noParams}) async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('shoesly_collections').get();
      return Right(querySnapshot.docs.map((e) => ProductModel.fromJson(e)).toList());
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
