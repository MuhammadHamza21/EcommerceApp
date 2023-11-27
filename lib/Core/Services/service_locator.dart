import 'dart:async';

import 'package:ecommerce_app/Authentication/data/data_source/auth_remote_datasource.dart';
import 'package:ecommerce_app/Authentication/data/repository/auth_repository.dart';
import 'package:ecommerce_app/Authentication/domain/repository/base_auth_repository.dart';
import 'package:ecommerce_app/Authentication/domain/usecases/login.dart';
import 'package:ecommerce_app/Authentication/presentation/controller/auth_cubit.dart';
import 'package:ecommerce_app/Core/Network/dio_helper.dart';
import 'package:ecommerce_app/Core/Network/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

class ServiceLocator {
  static FutureOr<void> init() async {
    // Bloc
    sl.registerFactory(() => AuthenticationCubit(sl()));
    // Repositories
    sl.registerLazySingleton<BaseAuthRepository>(
      () =>
          AuthRepository(baseAuthRemoteDatasource: sl(), baseNetworkInfo: sl()),
    );
    // Datasource
    sl.registerLazySingleton<BaseAuthRemoteDatasource>(
        () => AuthRemoteDatasource());
    // Usecases
    sl.registerLazySingleton(() => LoginUsecase(baseAuthRepository: sl()));
    // external
    await DioHelper.init();
    sl.registerLazySingleton(() => InternetConnectionChecker());
    sl.registerLazySingleton<BaseNetworkInfo>(
        () => NetworkInfo(connectionChecker: sl()));
  }
}
