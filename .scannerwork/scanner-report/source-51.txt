import 'package:dartz/dartz.dart';
import 'package:shoesly/features/product_detail_screen/domain/entities/comment_entity.dart';
import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';

abstract class ProductDetailRepository {
  Future<Either<Failure, bool>> commentProduct(
      {required CommentParams commentParams});

  Future<Either<Failure, List<CommentEntity>>> fetchComment(
      {required FetchCommentByProductIdParams fetchCommentByProductIdParams});

  Future<Either<Failure, List<CommentEntity>>> fetchCommentByStar(
      {required FetchCommentUnderStarsParams fetchCommentUnderStarsParams});
}
