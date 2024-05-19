import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesly/features/product_detail_screen/domain/usecases/comment_usecase.dart';
import 'package:shoesly/features/product_detail_screen/domain/usecases/fetch_comment_by_start_usecase.dart';
import 'package:shoesly/features/product_detail_screen/domain/usecases/fetch_review_usecase.dart';
import 'package:shoesly/features/product_detail_screen/presentation/bloc/product_detail_screen_state.dart';
import 'package:shoesly_core/params/params.dart';

part 'product_detail_screen_event.dart';

class ProductDetailScreenBloc
    extends Bloc<ProductDetailScreenEvent, ProductDetailScreenState> {
  final CommentUseCase commentUseCase;
  final FetchReviewUseCase fetchUseCase;
  final FetchCommentByStarUseCase fetchCommentByStarUseCase;
  ProductDetailScreenBloc({
    required this.commentUseCase,
    required this.fetchUseCase,
    required this.fetchCommentByStarUseCase,
  }) : super(const ProductDetailScreenState()) {
    on<CommentProductEvent>(_commentProduct);
    on<GetLatest3ReviewByProudctIdEvent>(_getCommentByProductId);
    on<GetCommentUnderStarsEvent>(_getCommentUnderStars);
  }

  void _commentProduct(
      CommentProductEvent event, Emitter<ProductDetailScreenState> emit) async {
    emit(state.copyWith(commentStatus: CommentStatus.loading));
    final response = await commentUseCase.call(event.commentParams);

    response.fold(
      (l) => emit(
        state.copyWith(
          commentStatus: CommentStatus.failure,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          commentStatus: CommentStatus.commented,
        ),
      ),
    );
  }

  void _getCommentByProductId(GetLatest3ReviewByProudctIdEvent event,
      Emitter<ProductDetailScreenState> emit) async {
    emit(state.copyWith(commentListStatus: CommentListStatus.loading));
    final response = await fetchUseCase.call(
      FetchCommentByProductIdParams(productId: event.productId),
    );

    response.fold(
      (l) => emit(
        state.copyWith(
          commentListStatus: CommentListStatus.failure,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          commentList: r,
          commentListStatus: CommentListStatus.fetched,
        ),
      ),
    );
  }

  void _getCommentUnderStars(GetCommentUnderStarsEvent event,
      Emitter<ProductDetailScreenState> emit) async {
    emit(state.copyWith(commentListStatus: CommentListStatus.loading));
    final response = await fetchCommentByStarUseCase.call(
      FetchCommentUnderStarsParams(
          stars: event.starts, productId: event.productId),
    );

    response.fold(
      (l) => emit(
        state.copyWith(
          commentListStatus: CommentListStatus.failure,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          commentList: r,
          commentListStatus: CommentListStatus.fetched,
        ),
      ),
    );
  }
}
