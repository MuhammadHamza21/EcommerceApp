import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class BaseAppRepository {
  Stream<InternetConnectionStatus> getConnectionStatus();
}
