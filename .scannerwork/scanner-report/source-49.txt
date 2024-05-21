import 'package:dartz/dartz.dart';

import 'package:shoesly/features/product_detail_screen/data/datasources/product_detail_remote_data_sources.dart';
import 'package:shoesly/features/product_detail_screen/domain/entities/comment_entity.dart';
import 'package:shoesly/features/product_detail_screen/domain/repositories/product_detail_repository.dart';
import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';

class ProductDetailRepoImpl extends ProductDetailRepository {
  late ProductDetailRemoteDataSources _productDetailRemoteDataSources;
  ProductDetailRepoImpl({
    required ProductDetailRemoteDataSources productDetailRemoteDataSources,
  }) {
    _productDetailRemoteDataSources = productDetailRemoteDataSources;
  }
  @override
  Future<Either<Failure, bool>> commentProduct(
      {required CommentParams commentParams}) {
    return _productDetailRemoteDataSources.postComment(
        commentParams: commentParams);
  }

  @override
  Future<Either<Failure, List<CommentEntity>>> fetchComment(
      {required FetchCommentByProductIdParams fetchCommentByProductIdParams}) {
    return _productDetailRemoteDataSources.fetchComment(
        fetchCommentByProductIdParams: fetchCommentByProductIdParams);
  }

  @override
  Future<Either<Failure, List<CommentEntity>>> fetchCommentByStar(
      {required FetchCommentUnderStarsParams fetchCommentUnderStarsParams}) {
    return _productDetailRemoteDataSources.fetchCommentUnderStart(
        fetchCommentUnderStarsParams: fetchCommentUnderStarsParams);
  }
}
