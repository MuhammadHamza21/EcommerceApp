// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:ecommerce_app/Authentication/data/data_source/auth_remote_datasource.dart';
import 'package:ecommerce_app/Authentication/domain/entities/user.dart';
import 'package:ecommerce_app/Authentication/domain/repository/base_auth_repository.dart';
import 'package:ecommerce_app/Authentication/domain/usecases/login.dart';
import 'package:ecommerce_app/Core/Constants/app_constants.dart';
import 'package:ecommerce_app/Core/Errors/exception/exceptions.dart';
import 'package:ecommerce_app/Core/Errors/failure/failures.dart';
import 'package:ecommerce_app/Core/Network/network_info.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthRemoteDatasource baseAuthRemoteDatasource;
  final BaseNetworkInfo baseNetworkInfo;
  AuthRepository({
    required this.baseAuthRemoteDatasource,
    required this.baseNetworkInfo,
  });
  @override
  Future<Either<Failure, User>> login(LoginParams params) async {
    if (await baseNetworkInfo.isConnected) {
      try {
        var result = await baseAuthRemoteDatasource.login(params);
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
