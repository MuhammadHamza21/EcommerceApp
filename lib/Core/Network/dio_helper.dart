import 'package:dio/dio.dart';
import 'package:ecommerce_app/Core/Constants/api_constants.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.kBaseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio!.get(
      url,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> post({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio!.post(
      url,
      data: data,
      queryParameters: queryParameters,
    );
  }
}
