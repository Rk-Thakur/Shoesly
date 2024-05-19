import 'package:equatable/equatable.dart';

enum AuthStatus { initial, loggedIn, logging, loggedOut, failure }

class AuthenticationState extends Equatable {
  final AuthStatus authStatus;
  final String message;
  const AuthenticationState({
    this.authStatus = AuthStatus.initial,
    this.message = '',
  });

  AuthenticationState copyWith({
    AuthStatus? authStatus,
    String? message,
  }) {
    return AuthenticationState(
      authStatus: authStatus ?? this.authStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [authStatus, message];
}
