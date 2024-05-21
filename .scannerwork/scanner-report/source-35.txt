import 'package:dartz/dartz.dart';

import 'package:shoesly/features/form_screen/domain/repositories/form_repository.dart';
import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';
import 'package:shoesly_core/usecases/shoesly_usecase.dart';

class FormUseCase implements ShoeslyUseCase<bool, FormParams> {
  late FormRepository _formRepository;
  FormUseCase({
    required FormRepository formRepository,
  }) {
    _formRepository = formRepository;
  }
  @override
  Future<Either<Failure, bool>> call(FormParams formParams) {
    return _formRepository.postProduct(formParams: formParams);
  }
}
