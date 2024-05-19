import 'package:get_it/get_it.dart';
import 'package:shoesly/features/authentication/data/datasources/authentication_remote_data_sources.dart';
import 'package:shoesly/features/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:shoesly/features/authentication/domain/usecases/google_login_usecase.dart';
import 'package:shoesly/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:shoesly/features/discover_screen/data/datasources/discover_remote_data_sources.dart';
import 'package:shoesly/features/discover_screen/data/repositories/discover_repo_impl.dart';
import 'package:shoesly/features/discover_screen/domain/usecases/product_list_brand_usecase.dart';
import 'package:shoesly/features/discover_screen/domain/usecases/product_list_usecase.dart';
import 'package:shoesly/features/discover_screen/presentation/bloc/discover_screen_bloc.dart';
import 'package:shoesly/features/form_screen/data/datasources/form_remote_data_sources.dart';
import 'package:shoesly/features/form_screen/data/repositories/form_repo_impl.dart';
import 'package:shoesly/features/form_screen/domain/usecases/form_usecase.dart';
import 'package:shoesly/features/form_screen/presentation/bloc/form_screen_bloc.dart';
import 'package:shoesly/features/product_detail_screen/data/datasources/product_detail_remote_data_sources.dart';
import 'package:shoesly/features/product_detail_screen/data/repositories/product_detail_repo_impl.dart';
import 'package:shoesly/features/product_detail_screen/domain/usecases/comment_usecase.dart';
import 'package:shoesly/features/product_detail_screen/domain/usecases/fetch_comment_by_start_usecase.dart';
import 'package:shoesly/features/product_detail_screen/domain/usecases/fetch_review_usecase.dart';
import 'package:shoesly/features/product_detail_screen/presentation/bloc/product_detail_screen_bloc.dart';
import 'package:shoesly/features/splash_screen/data/datasources/splash_remote_data_sources.dart';
import 'package:shoesly/features/splash_screen/data/repositories/splash_repo_impl.dart';
import 'package:shoesly/features/splash_screen/domain/usecases/auth_usecase.dart';
import 'package:shoesly/features/splash_screen/presentation/bloc/splash_screen_bloc.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  splashServiceLocator();
  authenticationServiceLocator();
  formServiceLocator();

  discoverServiceLocator();
  commentServiceLocator();
}

void commentServiceLocator() {
  getIt.registerSingleton(ProductDetailRemoteDataSourceImpl());

  getIt.registerSingleton(ProductDetailRepoImpl(
      productDetailRemoteDataSources:
          getIt<ProductDetailRemoteDataSourceImpl>()));

  getIt.registerSingleton(
    CommentUseCase(
      productDetailRepository: getIt<ProductDetailRepoImpl>(),
    ),
  );

  getIt.registerSingleton(
    FetchReviewUseCase(
      productDetailRepository: getIt<ProductDetailRepoImpl>(),
    ),
  );
  getIt.registerSingleton(
    FetchCommentByStarUseCase(
      productDetailRepository: getIt<ProductDetailRepoImpl>(),
    ),
  );

  getIt.registerFactory(
    () => ProductDetailScreenBloc(
      fetchCommentByStarUseCase: getIt<FetchCommentByStarUseCase>(),
      commentUseCase: getIt<CommentUseCase>(),
      fetchUseCase: getIt<FetchReviewUseCase>(),
    ),
  );
}

void splashServiceLocator() {
  getIt.registerSingleton(SplashRemoteDataSourcesImpl());

  getIt.registerSingleton(SplashRepoImpl(
      splashRemoteDataSources: getIt<SplashRemoteDataSourcesImpl>()));

  getIt.registerSingleton(
      AuthUseCase(splashRepository: getIt<SplashRepoImpl>()));

  getIt.registerFactory(
    () => SplashScreenBloc(
      authUseCase: getIt<AuthUseCase>(),
    ),
  );
}

void discoverServiceLocator() {
  getIt.registerSingleton(DiscoverRemoteDataSourcesImpl());

  getIt.registerSingleton(DiscoverRepoImpl(
      discoverRemoteDataSources: getIt<DiscoverRemoteDataSourcesImpl>()));

  getIt.registerSingleton(
      ProductListUseCase(discoverRepository: getIt<DiscoverRepoImpl>()));
  getIt.registerSingleton(
      ProductListBrandUsecase(discoverRepository: getIt<DiscoverRepoImpl>()));

  getIt.registerFactory(() => DiscoverScreenBloc(
        productListUseCase: getIt<ProductListUseCase>(),
        productListBrandUsecase: getIt<ProductListBrandUsecase>(),
      ));
}

void authenticationServiceLocator() {
  getIt.registerSingleton(AuthenticationRemoteDataSourcesImpl());
  getIt.registerSingleton(AuthenticationRepoImpl(
      authenticationRemoteDataSources:
          getIt<AuthenticationRemoteDataSourcesImpl>()));

  getIt.registerSingleton(GoogleLoginUseCase(
      authenticationRepository: getIt<AuthenticationRepoImpl>()));

  getIt.registerFactory(
    () => AuthenticationBloc(
      googleLoginUseCase: getIt<GoogleLoginUseCase>(),
    ),
  );
}

void formServiceLocator() {
  getIt.registerSingleton(FormDataRemoteDataSourcesImpl());

  getIt.registerSingleton(FormRepoImpl(
      formDataRemoteDataSources: getIt<FormDataRemoteDataSourcesImpl>()));

  getIt.registerSingleton(FormUseCase(formRepository: getIt<FormRepoImpl>()));

  getIt.registerFactory(
    () => FormScreenBloc(
      formUseCase: getIt<FormUseCase>(),
    ),
  );
}
