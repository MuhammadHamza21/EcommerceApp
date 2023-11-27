import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Authentication/domain/entities/user.dart';
import 'package:ecommerce_app/Authentication/domain/usecases/login.dart';
import 'package:ecommerce_app/Core/Errors/failure/failures.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, User>> login(LoginParams params);
}
