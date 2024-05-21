import 'package:dartz/dartz.dart';

import 'package:shoesly/features/product_detail_screen/domain/repositories/product_detail_repository.dart';
import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';
import 'package:shoesly_core/usecases/shoesly_usecase.dart';

class CommentUseCase implements ShoeslyUseCase<bool, CommentParams> {
  late ProductDetailRepository _productDetailRepository;
  CommentUseCase({
    required ProductDetailRepository productDetailRepository,
  }) {
    _productDetailRepository = productDetailRepository;
  }
  @override
  Future<Either<Failure, bool>> call(CommentParams commentParams) {
    return _productDetailRepository.commentProduct(
      commentParams: commentParams,
    );
  }
}
