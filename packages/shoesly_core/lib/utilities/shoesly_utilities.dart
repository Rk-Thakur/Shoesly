import 'package:flutter/material.dart';

class Utilities {
  Utilities._();

  static Future<dynamic> push(context, object,
      {bool fullScreenDialog = false, int transitionDuration = 50}) async {
    return await Navigator.of(context).push(
      PageRouteBuilder(
        fullscreenDialog: fullScreenDialog,
        transitionDuration: Duration(microseconds: transitionDuration),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return object;
        },
      ),
    );
  }

  static void pushNamedAndRemoveUntil(BuildContext context, String routeName) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }

  static Future<dynamic> pushNamed(BuildContext context, String routeName,
      {Object? arguments}) async {
    return await Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}
