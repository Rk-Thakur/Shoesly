import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shoesly/features/authentication/data/datasources/authentication_remote_data_sources.dart';

import 'package:shoesly/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:shoesly_core/error/failure.dart';

class AuthenticationRepoImpl extends AuthenticationRepository {
  late AuthenticationRemoteDataSources _authenticationRemoteDataSources;
  AuthenticationRepoImpl({
    required AuthenticationRemoteDataSources authenticationRemoteDataSources,
  }) {
    _authenticationRemoteDataSources = authenticationRemoteDataSources;
  }
  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() {
    return _authenticationRemoteDataSources.signInWithGoogle();
  }
}
