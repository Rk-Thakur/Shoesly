import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoesly_core/error/failure.dart';

abstract class SplashRepository {
  Future<Either<Failure, User>> authStatus();
}
