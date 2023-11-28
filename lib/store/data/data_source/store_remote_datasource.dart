import 'package:dio/dio.dart';
import 'package:ecommerce_app/store/data/models/product_model.dart';
import 'package:ecommerce_app/Core/Constants/api_constants.dart';
import 'package:ecommerce_app/Core/Errors/exception/exceptions.dart';
import 'package:ecommerce_app/Core/Network/dio_helper.dart';

abstract class BaseStoreRemoteDatasource {
  Future<List<ProductModel>> getFeaturedProducts();
  Future<List<ProductModel>> getPopularProducts();
}

class StoreRemoteDatasource extends BaseStoreRemoteDatasource {
  @override
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      var response = await DioHelper.get(url: ApiConstants.kProducts);
      if (response.statusCode == 200) {
        return List<ProductModel>.from(
          (response.data["data"] as List).map(
            (e) => ProductModel.fromJson(e),
          ),
        );
      } else {
        throw ServerException(message: response.data["message"]);
      }
    } on DioException catch (e) {
      throw ServerException(message: e.response!.data["message"]);
    }
  }

  @override
  Future<List<ProductModel>> getPopularProducts() async {
    try {
      var response = await DioHelper.get(url: ApiConstants.kPopularProducts);
      if (response.statusCode == 200) {
        return List<ProductModel>.from(
          (response.data["data"] as List).map(
            (e) => ProductModel.fromJson(e),
          ),
        );
      } else {
        throw ServerException(message: response.data["message"]);
      }
    } on DioException catch (e) {
      throw ServerException(message: e.response!.data["message"]);
    }
  }
}
