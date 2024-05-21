import 'package:dartz/dartz.dart';

import 'package:shoesly/features/product_detail_screen/domain/entities/comment_entity.dart';
import 'package:shoesly/features/product_detail_screen/domain/repositories/product_detail_repository.dart';
import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';
import 'package:shoesly_core/usecases/shoesly_usecase.dart';

class FetchReviewUseCase
    implements
        ShoeslyUseCase<List<CommentEntity>, FetchCommentByProductIdParams> {
  late ProductDetailRepository _productDetailRepository;
  FetchReviewUseCase({
    required ProductDetailRepository productDetailRepository,
  }) {
    _productDetailRepository = productDetailRepository;
  }

  @override
  Future<Either<Failure, List<CommentEntity>>> call(
      FetchCommentByProductIdParams fetchCommentByProductIdParams) {
    return _productDetailRepository.fetchComment(
      fetchCommentByProductIdParams: fetchCommentByProductIdParams,
    );
  }
}
