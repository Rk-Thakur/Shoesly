import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:shoesly/features/form_screen/domain/usecases/form_usecase.dart';
import 'package:shoesly/features/form_screen/presentation/bloc/form_screen_state.dart';
import 'package:shoesly_core/params/params.dart';

part 'form_screen_event.dart';

class FormScreenBloc extends Bloc<FormScreenEvent, FormScreenState> {
  final FormUseCase formUseCase;
  FormScreenBloc({
    required this.formUseCase,
  }) : super(const FormScreenState()) {
    on<AddProductEvent>(_postForm);
  }

  void _postForm(AddProductEvent event, Emitter<FormScreenState> emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    final response = await formUseCase.call(event.formParams);

    response.fold(
      (l) => emit(
          state.copyWith(formStatus: FormStatus.failure, message: l.message)),
      (r) => emit(
        state.copyWith(formStatus: FormStatus.posted),
      ),
    );
  }
}
