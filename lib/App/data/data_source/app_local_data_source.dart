import 'package:ecommerce_app/App/domain/usecases/save_value.dart';
import 'package:ecommerce_app/Core/Constants/app_constants.dart';
import 'package:ecommerce_app/Core/Errors/exception/exceptions.dart';
import 'package:ecommerce_app/Core/local/cache_helper.dart';

abstract class BaseAppLocalDatasource {
  Future<dynamic> getSavedValue(String key);
  Future<bool> saveValue(SaveValueParams params);
}

class AppLocalDatasource extends BaseAppLocalDatasource {
  @override
  Future<dynamic> getSavedValue(String key) async {
    try {
      var result = await CacheHelper.getData(key: key);
      return result;
    } catch (failure) {
      throw LocalException(message: AppConstants.localErrorMessage);
    }
  }

  @override
  Future<bool> saveValue(SaveValueParams params) async {
    try {
      var result = await CacheHelper.saveData(
        key: params.key,
        value: params.value,
      );
      return result;
    } catch (failure) {
      throw LocalException(message: AppConstants.localErrorMessage);
    }
  }
}
