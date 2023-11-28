import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/store/domain/entities/product.dart';
import 'package:ecommerce_app/Core/Errors/failure/failures.dart';

abstract class BaseStoreRepository {
  Future<Either<Failure, List<Product>>> getFeaturedProducts();
  Future<Either<Failure, List<Product>>> getPopularProducts();
}
