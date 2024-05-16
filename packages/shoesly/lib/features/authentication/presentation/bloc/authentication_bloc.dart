// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesly/features/authentication/domain/usecases/google_login_usecase.dart';

import 'package:shoesly/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:shoesly_core/params/params.dart';

part 'authentication_event.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GoogleLoginUseCase googleLoginUseCase;

  AuthenticationBloc({
    required this.googleLoginUseCase,
  }) : super(const AuthenticationState()) {
    on<AuthenticationGoogleLoginEvent>(_googleLogin);
  }

  FutureOr<void> _googleLogin(
      AuthenticationGoogleLoginEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(authStatus: AuthStatus.logging));
    final result = await googleLoginUseCase.call(NoParams());

    result.fold(
      (l) => emit(
        state.copyWith(
          authStatus: AuthStatus.failure,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          authStatus: AuthStatus.loggedIn,
        ),
      ),
    );
  }
}
