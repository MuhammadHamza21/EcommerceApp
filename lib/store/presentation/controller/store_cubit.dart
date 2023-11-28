// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:ecommerce_app/Core/Errors/failure/failures.dart';
import 'package:ecommerce_app/Core/Usecase/base_usecase.dart';
import 'package:ecommerce_app/Core/utils/enums.dart';
import 'package:ecommerce_app/store/domain/entities/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/store/domain/usecases/get_featured_products.dart';
import 'package:ecommerce_app/store/domain/usecases/get_popular_products.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit(
    this.getFeaturedProductsUsecase,
    this.getPopularProductsUsecase,
  ) : super(StoreInitialState());
  final GetFeaturedProductsUsecase getFeaturedProductsUsecase;
  final GetPopularProductsUsecase getPopularProductsUsecase;
  static StoreCubit get(BuildContext context) => BlocProvider.of(context);

  List<Product> featuredProducts = [];
  String featuredProductsMessage = "";
  List<Product> popularProducts = [];
  String popularProductsMessage = "";

  FutureOr<void> getFeaturedProducts() async {
    emit(state.copyWith(gettingFeaturedProductsState: RequestState.loading));
    var result = await getFeaturedProductsUsecase(NoParams());
    result.fold(
      (l) {
        featuredProductsMessage = l.message;
        if (l is ServerFailure) {
          emit(
              state.copyWith(gettingFeaturedProductsState: RequestState.error));
        } else if (l is OfflineFailure) {
          emit(state.copyWith(
              gettingFeaturedProductsState: RequestState.offline));
        }
      },
      (r) {
        featuredProducts = r;
        emit(state.copyWith(gettingFeaturedProductsState: RequestState.loaded));
      },
    );
  }

  FutureOr<void> getPopularProducts() async {
    emit(state.copyWith(gettingPopularProductsState: RequestState.loading));
    var result = await getPopularProductsUsecase(NoParams());
    result.fold(
      (l) {
        popularProductsMessage = l.message;
        if (l is ServerFailure) {
          emit(state.copyWith(gettingPopularProductsState: RequestState.error));
        } else if (l is OfflineFailure) {
          emit(state.copyWith(
              gettingPopularProductsState: RequestState.offline));
        }
      },
      (r) {
        popularProducts = r;
        emit(state.copyWith(gettingPopularProductsState: RequestState.loaded));
      },
    );
  }
}
