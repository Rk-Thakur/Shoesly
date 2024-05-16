import 'package:dartz/dartz.dart';
import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';

abstract class FormRepository {
  Future<Either<Failure, bool>> postProduct({required FormParams formParams});
}
