import 'package:dio/dio.dart';
import 'package:ecommerce_app/Authentication/data/models/user_model.dart';
import 'package:ecommerce_app/Authentication/domain/usecases/login.dart';
import 'package:ecommerce_app/Core/Constants/api_constants.dart';
import 'package:ecommerce_app/Core/Errors/exception/exceptions.dart';
import 'package:ecommerce_app/Core/Network/dio_helper.dart';

abstract class BaseAuthRemoteDatasource {
  Future<UserModel> login(LoginParams params);
}

class AuthRemoteDatasource extends BaseAuthRemoteDatasource {
  @override
  Future<UserModel> login(LoginParams params) async {
    try {
      var response = await DioHelper.post(
        url: ApiConstants.kLogin,
        data: {
          "provider": "customer",
          "username": params.username,
          "password": params.password,
        },
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException(message: response.data["message"]);
      }
    } on DioException catch (e) {
      throw ServerException(message: e.response!.data['message']);
    }
  }
}
