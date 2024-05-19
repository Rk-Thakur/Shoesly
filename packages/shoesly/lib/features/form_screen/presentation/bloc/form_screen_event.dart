// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'form_screen_bloc.dart';

abstract class FormScreenEvent extends Equatable {
  const FormScreenEvent();

  @override
  List<Object> get props => [];
}

class AddProductEvent extends FormScreenEvent {
  final FormParams formParams;
  const AddProductEvent({
    required this.formParams,
  });
}
