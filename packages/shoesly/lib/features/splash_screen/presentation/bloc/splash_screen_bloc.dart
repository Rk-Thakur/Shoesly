// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:shoesly/features/splash_screen/domain/usecases/auth_usecase.dart';
import 'package:shoesly/features/splash_screen/presentation/bloc/splash_screen_state.dart';
import 'package:shoesly_core/params/params.dart';

part 'splash_screen_event.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final AuthUseCase authUseCase;
  SplashScreenBloc({
    required this.authUseCase,
  }) : super(const SplashScreenState()) {
    on<AuthStatusEvent>(_authStatus);
  }

  FutureOr<void> _authStatus(
      SplashScreenEvent event, Emitter<dynamic> emit) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));

    final response = await authUseCase.call(NoParams());

    response.fold(
      (l) => emit(
        state.copyWith(
          message: l.message,
          authStatus: AuthStatus.failure,
        ),
      ),
      (r) => emit(
        state.copyWith(
          authStatus: AuthStatus.alreadyLoggedIn,
          user: r,
        ),
      ),
    );
  }
}
