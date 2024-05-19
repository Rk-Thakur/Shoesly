// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_screen_bloc.dart';

abstract class CartScreenEvent extends Equatable {
  const CartScreenEvent();

  @override
  List<Object> get props => [];
}

class AddCartEvent extends CartScreenEvent {
  final CartEntity cartEntity;
  const AddCartEvent({
    required this.cartEntity,
  });
}

class ListCartEvent extends CartScreenEvent {}

// ignore: must_be_immutable
class DeleteCartEvent extends CartScreenEvent {
  int index;
  DeleteCartEvent({
    required this.index,
  });
}
