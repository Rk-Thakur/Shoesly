import 'package:dartz/dartz.dart';

import 'package:shoesly/features/form_screen/data/datasources/form_remote_data_sources.dart';
import 'package:shoesly/features/form_screen/domain/repositories/form_repository.dart';
import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';

class FormRepoImpl extends FormRepository {
  late FormDataRemoteDataSources _formDataRemoteDataSources;
  FormRepoImpl({
    required FormDataRemoteDataSources formDataRemoteDataSources,
  }) {
    _formDataRemoteDataSources = formDataRemoteDataSources;
  }
  @override
  Future<Either<Failure, bool>> postProduct({required FormParams formParams}) {
    return _formDataRemoteDataSources.postProduct(formParams: formParams);
  }
}
