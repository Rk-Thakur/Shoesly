// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:shoesly/features/splash_screen/data/datasources/splash_remote_data_sources.dart';
import 'package:shoesly/features/splash_screen/domain/repositories/splash_repo.dart';
import 'package:shoesly_core/error/failure.dart';

class SplashRepoImpl extends SplashRepository {
  late SplashRemoteDataSources _splashRemoteDataSources;
  SplashRepoImpl({
    required SplashRemoteDataSources splashRemoteDataSources,
  }) {
    _splashRemoteDataSources = splashRemoteDataSources;
  }
  @override
  Future<Either<Failure, User>> authStatus() {
    return _splashRemoteDataSources.authStatus();
  }
}
