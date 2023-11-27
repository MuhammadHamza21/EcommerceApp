import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/Core/Errors/failure/failures.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUsecase<T, Parameters> {
  Future<Either<Failure, T>> call(Parameters parameters);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
