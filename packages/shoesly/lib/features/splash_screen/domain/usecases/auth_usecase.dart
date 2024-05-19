// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shoesly/features/splash_screen/domain/repositories/splash_repo.dart';
import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';
import 'package:shoesly_core/usecases/shoesly_usecase.dart';

class AuthUseCase implements ShoeslyUseCase<User?, NoParams> {
  late SplashRepository _splashRepository;
  AuthUseCase({
    required SplashRepository splashRepository,
  }) {
    _splashRepository = splashRepository;
  }
  @override
  Future<Either<Failure, User?>> call(NoParams params) {
    return _splashRepository.authStatus();
  }
}
