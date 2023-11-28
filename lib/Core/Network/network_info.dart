// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class BaseNetworkInfo {
  Future<bool> get isConnected;
  Stream<InternetConnectionStatus> get connectionStatus;
}

class NetworkInfo extends BaseNetworkInfo {
  InternetConnectionChecker connectionChecker;
  NetworkInfo({
    required this.connectionChecker,
  });
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;

  @override
  Stream<InternetConnectionStatus> get connectionStatus =>
      connectionChecker.onStatusChange;
}
