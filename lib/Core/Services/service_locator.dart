import 'dart:async';

import 'package:ecommerce_app/App/data/data_source/app_local_data_source.dart';
import 'package:ecommerce_app/App/data/data_source/app_remote_data_source.dart';
import 'package:ecommerce_app/App/data/repository/app_repository.dart';
import 'package:ecommerce_app/App/domain/repository/base_app_repository.dart';
import 'package:ecommerce_app/App/domain/usecases/get_connection_status.dart';
import 'package:ecommerce_app/App/domain/usecases/get_saved_value.dart';
import 'package:ecommerce_app/App/domain/usecases/save_value.dart';
import 'package:ecommerce_app/App/presentation/controller/app_cubit.dart';
import 'package:ecommerce_app/Authentication/data/data_source/auth_remote_datasource.dart';
import 'package:ecommerce_app/Authentication/data/repository/auth_repository.dart';
import 'package:ecommerce_app/Authentication/domain/repository/base_auth_repository.dart';
import 'package:ecommerce_app/Authentication/domain/usecases/login.dart';
import 'package:ecommerce_app/Authentication/presentation/controller/auth_cubit.dart';
import 'package:ecommerce_app/Cart/data/data_source/cart_repository.dart';
import 'package:ecommerce_app/Cart/data/repository/cart_repository.dart';
import 'package:ecommerce_app/Cart/domain/repository/base_cart_repository.dart';
import 'package:ecommerce_app/Cart/presentation/components/cart_cubit.dart';
import 'package:ecommerce_app/Core/Network/dio_helper.dart';
import 'package:ecommerce_app/Core/Network/network_info.dart';
import 'package:ecommerce_app/Core/local/cache_helper.dart';
import 'package:ecommerce_app/store/data/data_source/store_remote_datasource.dart';
import 'package:ecommerce_app/store/data/repository/store_repository.dart';
import 'package:ecommerce_app/store/domain/repository/base_store_repository.dart';
import 'package:ecommerce_app/store/domain/usecases/get_featured_products.dart';
import 'package:ecommerce_app/store/domain/usecases/get_popular_products.dart';
import 'package:ecommerce_app/store/presentation/controller/store_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static FutureOr<void> init() async {
    // Bloc
    sl.registerFactory(() => AuthenticationCubit(sl()));
    sl.registerFactory(() => StoreCubit(sl(), sl()));
    sl.registerFactory(() => AppCubit(sl(), sl(), sl()));
    sl.registerFactory(() => CartCubit());
    // Repositories
    sl.registerLazySingleton<BaseAuthRepository>(
      () =>
          AuthRepository(baseAuthRemoteDatasource: sl(), baseNetworkInfo: sl()),
    );
    sl.registerLazySingleton<BaseStoreRepository>(() => StoreRepository(
        baseStoreRemoteDatasource: sl(), baseNetworkInfo: sl()));
    sl.registerLazySingleton<BaseCartRepository>(() =>
        CartRepository(baseCartRemoteDatasource: sl(), baseNetworkInfo: sl()));
    sl.registerLazySingleton<BaseAppRepository>(
      () => AppRepository(
        baseNetworkInfo: sl(),
        baseAppRemoteDatasource: sl(),
        baseAppLocalDatasource: sl(),
      ),
    );
    // Datasource
    sl.registerLazySingleton<BaseAuthRemoteDatasource>(
        () => AuthRemoteDatasource());
    sl.registerLazySingleton<BaseStoreRemoteDatasource>(
        () => StoreRemoteDatasource());
    sl.registerLazySingleton<BaseCartRemoteDatasource>(
        () => CartRemoteDatasource());
    sl.registerLazySingleton<BaseAppRemoteDatasource>(
        () => AppRemoteDatasource());
    sl.registerLazySingleton<BaseAppLocalDatasource>(
        () => AppLocalDatasource());
    // Usecases
    sl.registerLazySingleton(() => LoginUsecase(baseAuthRepository: sl()));
    sl.registerLazySingleton(
        () => GetFeaturedProductsUsecase(baseStoreRepository: sl()));
    sl.registerLazySingleton(
        () => GetPopularProductsUsecase(baseStoreRepository: sl()));
    sl.registerLazySingleton(
        () => GetConnectionStatusUsecase(baseAppRepository: sl()));
    sl.registerLazySingleton(
        () => GetSavedValueUsecase(baseAppRepository: sl()));
    sl.registerLazySingleton(() => SaveValueUsecase(baseAppRepository: sl()));
    // external
    await DioHelper.init();
    await CacheHelper.init();
    sl.registerLazySingleton(() => InternetConnectionChecker());
    sl.registerLazySingleton<BaseNetworkInfo>(
        () => NetworkInfo(connectionChecker: sl()));
  }
}
