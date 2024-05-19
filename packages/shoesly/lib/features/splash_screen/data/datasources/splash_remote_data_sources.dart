import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoesly_core/error/failure.dart';

abstract class SplashRemoteDataSources {
  Future<Either<Failure, User>> authStatus();
}

class SplashRemoteDataSourcesImpl extends SplashRemoteDataSources {
  @override
  Future<Either<Failure, User>> authStatus() async {
    try {
      final firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser != null) {
        return Right(firebaseUser);
      } else {
        return Left(Failure(message: 'No User Found'));
      }
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
