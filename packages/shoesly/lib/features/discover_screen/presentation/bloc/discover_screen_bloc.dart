import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesly/features/discover_screen/domain/usecases/product_list_brand_usecase.dart';

import 'package:shoesly/features/discover_screen/domain/usecases/product_list_usecase.dart';
import 'package:shoesly/features/discover_screen/presentation/bloc/discover_screen_state.dart';
import 'package:shoesly_core/params/params.dart';

part 'discover_screen_event.dart';

class DiscoverScreenBloc
    extends Bloc<DiscoverScreenEvent, DiscoverScreenState> {
  final ProductListUseCase productListUseCase;
  final ProductListBrandUsecase productListBrandUsecase;
  DiscoverScreenBloc({
    required this.productListUseCase,
    required this.productListBrandUsecase,
  }) : super(const DiscoverScreenState()) {
    on<GetAllDiscoverEvent>(_productList);
    on<GetBrandDiscoverEvent>(_brandProductList);
  }

  void _productList(
      GetAllDiscoverEvent event, Emitter<DiscoverScreenState> emit) async {
    emit(state.copyWith(productListStatus: ProductListStatus.loading));

    final response = await productListUseCase.call(NoParams());

    response.fold(
      (l) => emit(state.copyWith(
        message: l.message,
        productListStatus: ProductListStatus.failure,
      )),
      (r) => emit(
        state.copyWith(
          productList: r,
          productListStatus: ProductListStatus.fetched,
        ),
      ),
    );
  }

  FutureOr<void> _brandProductList(
      GetBrandDiscoverEvent event, Emitter<DiscoverScreenState> emit) async {
    emit(state.copyWith(productListStatus: ProductListStatus.loading));

    final response = await productListBrandUsecase
        .call(BrandNameParams(brandName: event.brandName));

    response.fold(
      (l) => emit(state.copyWith(
        message: l.message,
        productListStatus: ProductListStatus.failure,
      )),
      (r) => emit(
        state.copyWith(
          productList: r,
          productListStatus: ProductListStatus.fetched,
        ),
      ),
    );
  }
}
