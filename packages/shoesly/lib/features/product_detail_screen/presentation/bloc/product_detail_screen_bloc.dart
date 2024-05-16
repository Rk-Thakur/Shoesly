import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'product_detail_screen_event.dart';
part 'product_detail_screen_state.dart';

class ProductDetailScreenBloc extends Bloc<ProductDetailScreenEvent, ProductDetailScreenState> {
  ProductDetailScreenBloc() : super(ProductDetailScreenInitial()) {
    on<ProductDetailScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
