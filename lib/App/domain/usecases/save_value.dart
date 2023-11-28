// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:ecommerce_app/App/domain/repository/base_app_repository.dart';
import 'package:ecommerce_app/Core/Errors/failure/failures.dart';
import 'package:ecommerce_app/Core/Usecase/base_usecase.dart';

class SaveValueUsecase extends BaseUsecase<bool, SaveValueParams> {
  final BaseAppRepository baseAppRepository;
  SaveValueUsecase({
    required this.baseAppRepository,
  });
  @override
  Future<Either<Failure, bool>> call(SaveValueParams parameters) async {
    return await baseAppRepository.saveValue(parameters);
  }
}

class SaveValueParams extends Equatable {
  final String key;
  final dynamic value;
  const SaveValueParams({
    required this.key,
    required this.value,
  });
  @override
  List<Object?> get props => [key, value];
}
