// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/App/domain/repository/base_app_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class GetConnectionStatusUsecase {
  final BaseAppRepository baseAppRepository;
  GetConnectionStatusUsecase({
    required this.baseAppRepository,
  });

  Stream<InternetConnectionStatus> call() {
    return baseAppRepository.getConnectionStatus();
  }
}
