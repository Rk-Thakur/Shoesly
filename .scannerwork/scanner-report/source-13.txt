import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shoesly/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:shoesly/features/authentication/presentation/bloc/authentication_state.dart';
import 'package:shoesly/utils/routing/routing.dart';
import 'package:shoesly_core/shoesly_core.dart';
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
        child: IgnorePointer(
          ignoring: authenticationState.authStatus == AuthStatus.logging
              ? true
              : false,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Lottie.asset('assets/animation.json'),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black54],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<AuthenticationBloc>()
                            .add(AuthenticationGoogleLoginEvent());
                      },
                      child: Container(
                        height: 54.h,
                        width: 160.w,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(100.sp),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.googlePlusG,
                                color: Colors.red,
                              ),
                              Text(
                                ShoeslyStrings.googleLogin,
                                style: GoogleFonts.urbanist(
                                    textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              authenticationState.authStatus == AuthStatus.logging
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : const SizedBox.shrink(),

              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       const Spacer(),
              //       ElevatedButton.icon(
              //         onPressed: () {},
              //         icon: const FaIcon(FontAwesomeIcons.googlePlusG),
              //         label: const Text('Sign in with Google'),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
