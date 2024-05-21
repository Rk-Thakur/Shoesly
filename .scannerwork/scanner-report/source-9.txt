import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoesly/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:shoesly_core/error/failure.dart';
import 'package:shoesly_core/params/params.dart';
import 'package:shoesly_core/usecases/shoesly_usecase.dart';

class GoogleLoginUseCase extends ShoeslyUseCase<UserCredential, NoParams> {
  late AuthenticationRepository _authenticationRepository;
  GoogleLoginUseCase({
    required AuthenticationRepository authenticationRepository,
  }) {
    _authenticationRepository = authenticationRepository;
  }

  @override
  Future<Either<Failure, UserCredential>> call(NoParams params) {
    return _authenticationRepository.signInWithGoogle();
  }
}
