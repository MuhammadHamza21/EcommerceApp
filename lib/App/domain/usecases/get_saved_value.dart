// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:ecommerce_app/App/domain/repository/base_app_repository.dart';
import 'package:ecommerce_app/Core/Errors/failure/failures.dart';
import 'package:ecommerce_app/Core/Usecase/base_usecase.dart';

class GetSavedValueUsecase extends BaseUsecase<dynamic, String> {
  final BaseAppRepository baseAppRepository;
  GetSavedValueUsecase({
    required this.baseAppRepository,
  });
  @override
  Future<Either<Failure, dynamic>> call(String parameters) async {
    return await baseAppRepository.getSavedValue(parameters);
  }
}
