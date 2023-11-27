part of 'auth_cubit.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object?> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class LoginLoadingState extends AuthenticationState {}

final class LoginOfflineState extends AuthenticationState {}

final class LoginSuccessState extends AuthenticationState {}

final class LoginErrorState extends AuthenticationState {}
