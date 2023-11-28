// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:ecommerce_app/store/data/data_source/store_remote_datasource.dart';
import 'package:ecommerce_app/store/domain/entities/product.dart';
import 'package:ecommerce_app/store/domain/repository/base_store_repository.dart';
import 'package:ecommerce_app/Core/Constants/app_constants.dart';
import 'package:ecommerce_app/Core/Errors/exception/exceptions.dart';
import 'package:ecommerce_app/Core/Errors/failure/failures.dart';
import 'package:ecommerce_app/Core/Network/network_info.dart';

class StoreRepository extends BaseStoreRepository {
  final BaseStoreRemoteDatasource baseStoreRemoteDatasource;
  final BaseNetworkInfo baseNetworkInfo;
  StoreRepository({
    required this.baseStoreRemoteDatasource,
    required this.baseNetworkInfo,
  });
  @override
  Future<Either<Failure, List<Product>>> getFeaturedProducts() async {
    if (await baseNetworkInfo.isConnected) {
      try {
        var result = await baseStoreRemoteDatasource.getFeaturedProducts();
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(message: failure.message));
      }
    } else {
      return const Left(
        OfflineFailure(
          message: AppConstants.offlineErrorMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getPopularProducts() async {
    if (await baseNetworkInfo.isConnected) {
      try {
        var result = await baseStoreRemoteDatasource.getPopularProducts();
        return Right(result);
      } on ServerException catch (failure) {
        return Left(ServerFailure(message: failure.message));
      }
    } else {
      return const Left(
        OfflineFailure(
          message: AppConstants.offlineErrorMessage,
        ),
      );
    }
  }
}
