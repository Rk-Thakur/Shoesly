import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:shoesly_core/error/failure.dart';

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRemoteDataSources {
  Future<Either<Failure, UserCredential>> signInWithGoogle();
}

final GoogleSignIn googleSignIn = GoogleSignIn(
  scopes: ['email'],
);

class AuthenticationRemoteDataSourcesImpl extends AuthenticationRemoteDataSources {
  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      final responseCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      return Right(responseCredential);
    } on FirebaseException catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
