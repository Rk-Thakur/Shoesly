import 'package:dartz/dartz.dart';
import 'package:shoesly_core/error/failure.dart';

abstract class ShoeslyUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
