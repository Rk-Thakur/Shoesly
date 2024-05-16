import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:shoesly/features/discover_screen/domain/entities/product_entity.dart';
import 'package:shoesly/features/discover_screen/domain/usecases/product_list_usecase.dart';
import 'package:shoesly/features/discover_screen/presentation/bloc/discover_screen_state.dart';
import 'package:shoesly_core/params/params.dart';

part 'discover_screen_event.dart';

class DiscoverScreenBloc extends Bloc<DiscoverScreenEvent, DiscoverScreenState> {
  final ProductListUseCase productListUseCase;
  DiscoverScreenBloc({
    required this.productListUseCase,
  }) : super(const DiscoverScreenState()) {
    on<GetAllDiscoverEvent>(_productList);
  }

  void _productList(GetAllDiscoverEvent event, Emitter<DiscoverScreenState> emit) async {
    emit(state.copyWith(productListStatus: ProductListStatus.loading));

    final response = await productListUseCase.call(NoParams());

    response.fold(
      (l) => emit(state.copyWith(message: l.message)),
      (r) => emit(
        state.copyWith(
          productList: r,
          productListStatus: ProductListStatus.fetched,
        ),
      ),
    );
  }
}
