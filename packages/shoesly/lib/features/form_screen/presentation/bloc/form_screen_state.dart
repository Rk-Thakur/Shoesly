import 'package:equatable/equatable.dart';

enum FormStatus { initial, loading, posted, failure }

class FormScreenState extends Equatable {
  final FormStatus formStatus;
  final String message;
  const FormScreenState({
    this.formStatus = FormStatus.initial,
    this.message = '',
  });

  FormScreenState copyWith({
    FormStatus? formStatus,
    String? message,
  }) {
    return FormScreenState(
      formStatus: formStatus ?? this.formStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [formStatus, message];
}
