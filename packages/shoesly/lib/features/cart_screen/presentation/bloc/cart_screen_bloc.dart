import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesly/features/cart_screen/domain/entities/cart_list_entity.dart';
import 'package:shoesly/features/cart_screen/presentation/bloc/cart_screen_state.dart';

part 'cart_screen_event.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(const CartScreenState()) {
    List<CartEntity> listCartEntity = [];
    on<AddCartEvent>((event, emit) {
      emit(state.copyWith(cartStatus: CartStatus.loading));

      listCartEntity.add(event.cartEntity);
      emit(state.copyWith(
        cartStatus: CartStatus.added,
      ));
    });

    on<ListCartEvent>((event, emit) {
      emit(state.copyWith(cartStatus: CartStatus.loading));
      emit(state.copyWith(
        cartStatus: CartStatus.fetched,
        cartList: listCartEntity,
      ));
    });

    on<DeleteCartEvent>((event, emit) {
      emit(state.copyWith(cartStatus: CartStatus.loading));
      if (listCartEntity.isNotEmpty) {
        listCartEntity.removeAt(event.index);
        emit(state.copyWith(
          cartStatus: CartStatus.fetched,
          cartList: listCartEntity,
        ));
      }
    });
  }
}
