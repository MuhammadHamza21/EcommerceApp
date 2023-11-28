// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:ecommerce_app/Core/Constants/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:ecommerce_app/App/domain/usecases/get_connection_status.dart';
import 'package:ecommerce_app/App/domain/usecases/get_saved_value.dart';
import 'package:ecommerce_app/App/domain/usecases/save_value.dart';
import 'package:ecommerce_app/App/presentation/screens/account_screen.dart';
import 'package:ecommerce_app/Cart/presentation/screen/cart_screen.dart';
import 'package:ecommerce_app/Core/utils/enums.dart';
import 'package:ecommerce_app/store/presentation/screens/categories_screen.dart';
import 'package:ecommerce_app/store/presentation/screens/main_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(
    this.getConnectionStatusUsecase,
    this.saveValueUsecase,
    this.getSavedValueUsecase,
  ) : super(AppInitialState());
  final GetConnectionStatusUsecase getConnectionStatusUsecase;
  final SaveValueUsecase saveValueUsecase;
  final GetSavedValueUsecase getSavedValueUsecase;
  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];
  int currentIndex = 0;
  String accessToken = "";
  String accessTokenMessage = "";
  String refreshToken = "";
  String refreshTokenMessage = "";
  void changeCurrentIndex(int index) {
    emit(state.copyWith(changingCurrentIndexState: RequestState.loading));
    currentIndex = index;
    emit(state.copyWith(changingCurrentIndexState: RequestState.loaded));
  }

  Stream<InternetConnectionStatus> getConnectionStatus() {
    return getConnectionStatusUsecase();
  }

  FutureOr<void> saveAccessToken(String token) async {
    accessToken = token;
    emit(state.copyWith(accessTokenState: RequestState.loading));
    var result = await saveValueUsecase(
      SaveValueParams(
        key: AppConstants.accessToken,
        value: token,
      ),
    );
    result.fold(
      (l) {
        accessTokenMessage = l.message;
        emit(state.copyWith(accessTokenState: RequestState.error));
      },
      (r) {
        emit(state.copyWith(accessTokenState: RequestState.error));
      },
    );
  }

  FutureOr<void> getAccessToken() async {
    emit(state.copyWith(accessTokenState: RequestState.loading));
    var result = await getSavedValueUsecase(AppConstants.accessToken);
    result.fold(
      (l) {
        accessTokenMessage = l.message;
        emit(state.copyWith(accessTokenState: RequestState.error));
      },
      (r) {
        accessToken = r ?? "";
        emit(state.copyWith(accessTokenState: RequestState.loaded));
      },
    );
  }

  FutureOr<void> saveRefreshToken(String token) async {
    refreshToken = token;
    emit(state.copyWith(refreshTokenState: RequestState.loading));
    var result = await saveValueUsecase(
      SaveValueParams(
        key: AppConstants.refreshToken,
        value: token,
      ),
    );
    result.fold(
      (l) {
        refreshTokenMessage = l.message;
        emit(state.copyWith(refreshTokenState: RequestState.error));
      },
      (r) {
        emit(state.copyWith(refreshTokenState: RequestState.loaded));
      },
    );
  }

  FutureOr<void> getRefreshToken() async {
    emit(state.copyWith(refreshTokenState: RequestState.loading));
    var result = await getSavedValueUsecase(AppConstants.refreshToken);
    result.fold(
      (l) {
        refreshTokenMessage = l.message;
        emit(state.copyWith(refreshTokenState: RequestState.error));
      },
      (r) {
        refreshToken = r ?? "";
        emit(state.copyWith(refreshTokenState: RequestState.loaded));
      },
    );
  }
}
