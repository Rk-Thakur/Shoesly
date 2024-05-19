// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:shoesly/features/product_detail_screen/domain/entities/comment_entity.dart';

enum CommentStatus { initial, loading, commented, failure }

enum CommentListStatus { initial, loading, fetched, failure }

class ProductDetailScreenState extends Equatable {
  final CommentStatus commentStatus;
  final String message;
  final List<CommentEntity> commentList;
  final CommentListStatus commentListStatus;
  final String screenKey;
  const ProductDetailScreenState(
      {this.commentStatus = CommentStatus.initial,
      this.message = '',
      this.commentList = const [],
      this.commentListStatus = CommentListStatus.initial,
      this.screenKey = ''});

  @override
  List<Object?> get props =>
      [commentStatus, message, commentList, commentListStatus, screenKey];

  ProductDetailScreenState copyWith({
    CommentStatus? commentStatus,
    String? message,
    List<CommentEntity>? commentList,
    CommentListStatus? commentListStatus,
    String? screenKey,
  }) {
    return ProductDetailScreenState(
      commentStatus: commentStatus ?? this.commentStatus,
      message: message ?? this.message,
      commentList: commentList ?? this.commentList,
      commentListStatus: commentListStatus ?? this.commentListStatus,
      screenKey: screenKey ?? this.screenKey,
    );
  }
}
