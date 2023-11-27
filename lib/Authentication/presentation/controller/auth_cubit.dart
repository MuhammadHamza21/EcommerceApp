// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:ecommerce_app/Authentication/domain/entities/user.dart';
import 'package:ecommerce_app/Core/Errors/failure/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecommerce_app/Authentication/domain/usecases/login.dart';

part 'auth_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(
    this.loginUsecase,
  ) : super(AuthenticationInitial());
  final LoginUsecase loginUsecase;
  static AuthenticationCubit get(BuildContext context) =>
      BlocProvider.of(context);

  User? loginUser;
  String loginMessage = '';

  FutureOr<void> login(LoginParams params) async {
    emit(LoginLoadingState());
    var result = await loginUsecase(params);
    result.fold(
      (l) {
        loginMessage = l.message;
        if (l is ServerFailure) {
          emit(LoginErrorState());
        } else if (l is OfflineFailure) {
          emit(LoginOfflineState());
        }
      },
      (r) {
        loginUser = r;
        emit(LoginSuccessState());
      },
    );
  }
}
