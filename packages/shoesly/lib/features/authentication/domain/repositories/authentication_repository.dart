import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shoesly_core/error/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserCredential>> signInWithGoogle();
}
