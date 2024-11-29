import 'package:flutter/material.dart';

enum Flavor { dev, staging, prod }

abstract class AppEnviroment {
  static late String baseurl;
  static late String title;
  static late Flavor _flavor;
  static late MaterialColor primarySwatch;
  static Flavor get flavor => _flavor;
  static void setUpEnv(Flavor flavor) {
    _flavor = flavor;
    switch (flavor) {
      case Flavor.dev:
        {
          baseurl = '';
          title = 'Shoesly Development';
          primarySwatch = Colors.amber;
        }
        break;
      case Flavor.staging:
        {
          baseurl = '';
          title = 'Shoesly QA or Staging Enviroment';
          primarySwatch = Colors.blue;
        }
        break;
      case Flavor.prod:
        {
          baseurl = '';
          title = 'Shoesly Production';
          primarySwatch = Colors.green;
        }
        break;
      default:
        {
          baseurl = '';
          title = 'Shoesly Development';
          primarySwatch = Colors.amber;
        }
    }
  }
}
