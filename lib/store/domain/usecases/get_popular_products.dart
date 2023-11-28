// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:ecommerce_app/store/domain/entities/product.dart';
import 'package:ecommerce_app/store/domain/repository/base_store_repository.dart';
import 'package:ecommerce_app/Core/Errors/failure/failures.dart';
import 'package:ecommerce_app/Core/Usecase/base_usecase.dart';

class GetPopularProductsUsecase extends BaseUsecase<List<Product>, NoParams> {
  final BaseStoreRepository baseStoreRepository;
  GetPopularProductsUsecase({
    required this.baseStoreRepository,
  });
  @override
  Future<Either<Failure, List<Product>>> call(NoParams parameters) async {
    return await baseStoreRepository.getPopularProducts();
  }
}
