// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthStatus { initial, loading, alreadyLoggedIn, failure }

class SplashScreenState extends Equatable {
  final AuthStatus authStatus;
  final String message;
  final User? user;
  const SplashScreenState(
      {this.authStatus = AuthStatus.initial, this.message = '', this.user});
  @override
  List<Object?> get props => [authStatus, message, user];

  SplashScreenState copyWith({
    AuthStatus? authStatus,
    String? message,
    User? user,
  }) {
    return SplashScreenState(
      authStatus: authStatus ?? this.authStatus,
      message: message ?? this.message,
      user: user ?? this.user,
    );
  }
}
