// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerce_app/Authentication/domain/entities/user.dart';
import 'package:ecommerce_app/Authentication/domain/repository/base_auth_repository.dart';
import 'package:ecommerce_app/Core/Errors/failure/failures.dart';
import 'package:ecommerce_app/Core/Usecase/base_usecase.dart';

class LoginUsecase extends BaseUsecase<User, LoginParams> {
  final BaseAuthRepository baseAuthRepository;
  LoginUsecase({
    required this.baseAuthRepository,
  });
  @override
  Future<Either<Failure, User>> call(LoginParams parameters) async {
    return await baseAuthRepository.login(parameters);
  }
}

class LoginParams extends Equatable {
  final String username;
  final String password;
  const LoginParams({
    required this.username,
    required this.password,
  });
  @override
  List<Object?> get props => [username, password];
}
