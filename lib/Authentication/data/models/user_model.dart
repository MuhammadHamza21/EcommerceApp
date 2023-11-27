import 'package:ecommerce_app/Authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({required super.message, required super.data});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"] ?? "",
        data: DataModel.fromJson(
          json["data"],
        ),
      );
}

class DataModel extends Data {
  const DataModel({required super.accessToken, required super.refreshToken});

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        accessToken: json["access_token"] ?? "",
        refreshToken: json["refresh_token"] ?? "",
      );
}
