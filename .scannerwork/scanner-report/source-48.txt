import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoesly/features/product_detail_screen/domain/entities/comment_entity.dart';

class CommentModel extends CommentEntity {
  const CommentModel(
      {required super.productReview,
      required super.reviewedTime,
      required super.stars,
      required super.userName,
      required super.userProfile});

  factory CommentModel.fromJson(DocumentSnapshot doc) {
    Map<String, dynamic> map = doc.data() as Map<String, dynamic>;
    Timestamp timestamp = map['reviewedTime'];
    return CommentModel(
      productReview: map['productReview'],
      reviewedTime: timestamp.toDate(),
      stars: map['stars'],
      userName: map['userName'],
      userProfile: map['userProfile'],
    );
  }
}
