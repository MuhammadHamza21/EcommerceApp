// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/App/domain/usecases/get_connection_status.dart';
import 'package:ecommerce_app/App/presentation/screens/account_screen.dart';
import 'package:ecommerce_app/Cart/presentation/screen/cart_screen.dart';
import 'package:ecommerce_app/Core/utils/enums.dart';
import 'package:ecommerce_app/store/presentation/screens/categories_screen.dart';
import 'package:ecommerce_app/store/presentation/screens/main_screen.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(
    this.getConnectionStatusUsecase,
  ) : super(AppInitialState());
  final GetConnectionStatusUsecase getConnectionStatusUsecase;
  static AppCubit get(BuildContext context) => BlocProvider.of(context);

  List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];
  int currentIndex = 0;
  void changeCurrentIndex(int index) {
    emit(state.copyWith(changingCurrentIndexState: RequestState.loading));
    currentIndex = index;
    emit(state.copyWith(changingCurrentIndexState: RequestState.loaded));
  }

  Stream<InternetConnectionStatus> getConnectionStatus() {
    return getConnectionStatusUsecase();
  }
}
