import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:shoesly/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:shoesly/utils/routing/src/routes.dart';
import 'package:shoesly_core/utilities/shoesly_utilities.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final authenticationState = context.watch<AuthenticationBloc>().state;

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state.authStatus == AuthStatus.loggedIn) {
                  Utilities.pushNamedAndRemoveUntil(
                    context,
                    ShoeslyRoutes.discoverScreen,
                  );
                } else if (state.authStatus == AuthStatus.failure) {
                  log('The authentication misatek is ${state.message}');
                }
              },
              child: Center(
                child: IconButton(
                    onPressed: () {
                      print("the loggin event is clicekd");
                      context.read<AuthenticationBloc>().add(AuthenticationGoogleLoginEvent());
                    },
                    icon: const Icon(
                      Icons.login,
                    )),
              ),
            ),
            authenticationState.authStatus == AuthStatus.logging
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
