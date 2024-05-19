part of 'product_detail_screen_bloc.dart';

abstract class ProductDetailScreenEvent extends Equatable {
  const ProductDetailScreenEvent();

  @override
  List<Object> get props => [];
}

class CommentProductEvent extends ProductDetailScreenEvent {
  final CommentParams commentParams;
  const CommentProductEvent({
    required this.commentParams,
  });
}

class GetLatest3ReviewByProudctIdEvent extends ProductDetailScreenEvent {
  final String productId;
  const GetLatest3ReviewByProudctIdEvent({
    required this.productId,
  });
}

class GetCommentUnderStarsEvent extends ProductDetailScreenEvent {
  final String productId;
  final int starts;
  const GetCommentUnderStarsEvent({
    required this.productId,
    required this.starts,
  });
}
