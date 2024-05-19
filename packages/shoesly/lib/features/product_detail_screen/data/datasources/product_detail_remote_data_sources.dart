import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoesly/features/product_detail_screen/data/models/comment_model.dart';

import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';

User? currentUser = FirebaseAuth.instance.currentUser;

abstract class ProductDetailRemoteDataSources {
  Future<Either<Failure, bool>> postComment(
      {required CommentParams commentParams});

  Future<Either<Failure, List<CommentModel>>> fetchComment(
      {required FetchCommentByProductIdParams fetchCommentByProductIdParams});

  Future<Either<Failure, List<CommentModel>>> fetchCommentUnderStart(
      {required FetchCommentUnderStarsParams fetchCommentUnderStarsParams});
}

class ProductDetailRemoteDataSourceImpl extends ProductDetailRemoteDataSources {
  @override
  Future<Either<Failure, bool>> postComment(
      {required CommentParams commentParams}) async {
    try {
      FirebaseFirestore.instance
          .collection(commentParams.productId.toString())
          .add({
        'productReview': commentParams.review,
        'stars': commentParams.star,
        'reviewedTime': Timestamp.now(),
        'userName': currentUser?.displayName,
        'userProfile': currentUser?.photoURL,
      });
      return const Right(true);
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CommentModel>>> fetchComment(
      {required FetchCommentByProductIdParams
          fetchCommentByProductIdParams}) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection(fetchCommentByProductIdParams.productId.toString())
          .get();

      return Right(
        querySnapshot.docs.map((e) => CommentModel.fromJson(e)).toList(),
      );
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CommentModel>>> fetchCommentUnderStart(
      {required FetchCommentUnderStarsParams
          fetchCommentUnderStarsParams}) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection(fetchCommentUnderStarsParams.productId.toString())
          .where('stars', isEqualTo: fetchCommentUnderStarsParams.stars)
          .get();

      return Right(
        querySnapshot.docs.map((e) => CommentModel.fromJson(e)).toList(),
      );
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
