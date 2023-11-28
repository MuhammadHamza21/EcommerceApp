// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:ecommerce_app/App/data/data_source/app_data_source.dart';
import 'package:ecommerce_app/App/domain/repository/base_app_repository.dart';
import 'package:ecommerce_app/Core/Network/network_info.dart';

class AppRepository extends BaseAppRepository {
  final BaseNetworkInfo baseNetworkInfo;
  final BaseAppRemoteDatasource baseAppRemoteDatasource;
  AppRepository({
    required this.baseNetworkInfo,
    required this.baseAppRemoteDatasource,
  });
  @override
  Stream<InternetConnectionStatus> getConnectionStatus() {
    return baseNetworkInfo.connectionStatus;
  }
}
