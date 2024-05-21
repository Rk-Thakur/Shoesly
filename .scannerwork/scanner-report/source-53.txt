import 'package:dartz/dartz.dart';
import 'package:shoesly/features/product_detail_screen/domain/entities/comment_entity.dart';

import 'package:shoesly/features/product_detail_screen/domain/repositories/product_detail_repository.dart';
import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';
import 'package:shoesly_core/usecases/shoesly_usecase.dart';

class FetchCommentByStarUseCase
    implements
        ShoeslyUseCase<List<CommentEntity>, FetchCommentUnderStarsParams> {
  late ProductDetailRepository _productDetailRepository;
  FetchCommentByStarUseCase({
    required ProductDetailRepository productDetailRepository,
  }) {
    _productDetailRepository = productDetailRepository;
  }
  @override
  Future<Either<Failure, List<CommentEntity>>> call(
      FetchCommentUnderStarsParams fetchCommentUnderStarsParams) {
    return _productDetailRepository.fetchCommentByStar(
        fetchCommentUnderStarsParams: fetchCommentUnderStarsParams);
  }
}
