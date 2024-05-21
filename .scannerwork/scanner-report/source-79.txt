import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/injector/service_locator.dart';
import 'package:shoesly/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shoesly/features/cart_screen/presentation/bloc/cart_screen_bloc.dart';
import 'package:shoesly/features/discover_screen/presentation/bloc/discover_screen_bloc.dart';

import 'package:shoesly/features/form_screen/presentation/bloc/form_screen_bloc.dart';
import 'package:shoesly/features/product_detail_screen/presentation/bloc/product_detail_screen_bloc.dart';
import 'package:shoesly/features/splash_screen/presentation/bloc/splash_screen_bloc.dart';

class ShoeslyBlocProvider {
  ShoeslyBlocProvider._();

  static List<SingleChildWidget> providers = [
    BlocProvider(
      create: (context) => getIt<SplashScreenBloc>(),
    ),
    BlocProvider(
      create: (context) => getIt<AuthenticationBloc>(),
    ),
    BlocProvider(
      create: (context) => getIt<DiscoverScreenBloc>(),
    ),
    BlocProvider(
      create: (context) => getIt<FormScreenBloc>(),
    ),
    BlocProvider(
      create: (context) => getIt<ProductDetailScreenBloc>(),
    ),
    BlocProvider(
      create: (context) => CartScreenBloc(),
    ),
  ];
}
