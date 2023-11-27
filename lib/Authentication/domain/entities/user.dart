// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String message;
  final Data data;
  const User({
    required this.message,
    required this.data,
  });
  @override
  List<Object?> get props => [data, message];
}

class Data extends Equatable {
  final String accessToken;
  final String refreshToken;
  const Data({
    required this.accessToken,
    required this.refreshToken,
  });
  @override
  List<Object?> get props => [refreshToken, accessToken];
}
