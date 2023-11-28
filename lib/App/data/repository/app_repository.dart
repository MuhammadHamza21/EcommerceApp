// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Core/Errors/exception/exceptions.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:ecommerce_app/App/data/data_source/app_local_data_source.dart';
import 'package:ecommerce_app/App/data/data_source/app_remote_data_source.dart';
import 'package:ecommerce_app/App/domain/repository/base_app_repository.dart';
import 'package:ecommerce_app/App/domain/usecases/save_value.dart';
import 'package:ecommerce_app/Core/Errors/failure/failures.dart';
import 'package:ecommerce_app/Core/Network/network_info.dart';

class AppRepository extends BaseAppRepository {
  final BaseNetworkInfo baseNetworkInfo;
  final BaseAppRemoteDatasource baseAppRemoteDatasource;
  final BaseAppLocalDatasource baseAppLocalDatasource;
  AppRepository({
    required this.baseNetworkInfo,
    required this.baseAppRemoteDatasource,
    required this.baseAppLocalDatasource,
  });
  @override
  Stream<InternetConnectionStatus> getConnectionStatus() {
    return baseNetworkInfo.connectionStatus;
  }

  @override
  Future<Either<Failure, dynamic>> getSavedValue(String key) async {
    try {
      var result = await baseAppLocalDatasource.getSavedValue(key);
      return Right(result);
    } on LocalException catch (failure) {
      return Left(CacheFailure(message: failure.message));
    }
  }

  @override
  Future<Either<Failure, bool>> saveValue(SaveValueParams params) async {
    try {
      var result = await baseAppLocalDatasource.saveValue(params);
      return Right(result);
    } on LocalException catch (failure) {
      return Left(CacheFailure(message: failure.message));
    }
  }
}
