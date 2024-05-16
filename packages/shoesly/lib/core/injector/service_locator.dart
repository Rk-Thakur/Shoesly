import 'package:get_it/get_it.dart';
import 'package:shoesly/features/authentication/data/datasources/authentication_remote_data_sources.dart';
import 'package:shoesly/features/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:shoesly/features/authentication/domain/usecases/google_login_usecase.dart';
import 'package:shoesly/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:shoesly/features/discover_screen/data/datasources/discover_remote_data_sources.dart';
import 'package:shoesly/features/discover_screen/data/repositories/discover_repo_impl.dart';
import 'package:shoesly/features/discover_screen/domain/usecases/product_list_usecase.dart';
import 'package:shoesly/features/discover_screen/presentation/bloc/discover_screen_bloc.dart';
import 'package:shoesly/features/form_screen/data/datasources/form_remote_data_sources.dart';
import 'package:shoesly/features/form_screen/data/repositories/form_repo_impl.dart';
import 'package:shoesly/features/form_screen/domain/usecases/form_usecase.dart';
import 'package:shoesly/features/form_screen/presentation/bloc/form_screen_bloc.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  authenticationServiceLocator();
  formServiceLocator();
  discoverServiceLocator();
}

void discoverServiceLocator() {
  getIt.registerSingleton(DiscoverRemoteDataSourcesImpl());

  getIt.registerSingleton(
      DiscoverRepoImpl(discoverRemoteDataSources: getIt<DiscoverRemoteDataSourcesImpl>()));

  getIt.registerSingleton(ProductListUseCase(discoverRepository: getIt<DiscoverRepoImpl>()));

  getIt.registerFactory(() => DiscoverScreenBloc(productListUseCase: getIt<ProductListUseCase>()));
}

void authenticationServiceLocator() {
  getIt.registerSingleton(AuthenticationRemoteDataSourcesImpl());
  getIt.registerSingleton(AuthenticationRepoImpl(
      authenticationRemoteDataSources: getIt<AuthenticationRemoteDataSourcesImpl>()));

  getIt.registerSingleton(
      GoogleLoginUseCase(authenticationRepository: getIt<AuthenticationRepoImpl>()));

  getIt.registerFactory(
    () => AuthenticationBloc(
      googleLoginUseCase: getIt<GoogleLoginUseCase>(),
    ),
  );
}

void formServiceLocator() {
  getIt.registerSingleton(FormDataRemoteDataSourcesImpl());

  getIt.registerSingleton(
      FormRepoImpl(formDataRemoteDataSources: getIt<FormDataRemoteDataSourcesImpl>()));

  getIt.registerSingleton(FormUseCase(formRepository: getIt<FormRepoImpl>()));

  getIt.registerFactory(
    () => FormScreenBloc(
      formUseCase: getIt<FormUseCase>(),
    ),
  );
}
