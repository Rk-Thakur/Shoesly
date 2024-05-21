import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  final String productReview;
  final DateTime reviewedTime;
  final int stars;
  final String userName;
  final String userProfile;
  const CommentEntity({
    required this.productReview,
    required this.reviewedTime,
    required this.stars,
    required this.userName,
    required this.userProfile,
  });

  @override
  List<Object?> get props =>
      [productReview, reviewedTime, stars, userName, userProfile];
}
