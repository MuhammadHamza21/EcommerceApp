import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/App/domain/usecases/save_value.dart';
import 'package:ecommerce_app/Core/Errors/failure/failures.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class BaseAppRepository {
  Stream<InternetConnectionStatus> getConnectionStatus();
  Future<Either<Failure, dynamic>> getSavedValue(String key);
  Future<Either<Failure, bool>> saveValue(SaveValueParams params);
}
