// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/Cart/data/data_source/cart_repository.dart';
import 'package:ecommerce_app/Cart/domain/repository/base_cart_repository.dart';
import 'package:ecommerce_app/Core/Network/network_info.dart';

class CartRepository extends BaseCartRepository {
  final BaseCartRemoteDatasource baseCartRemoteDatasource;
  final BaseNetworkInfo baseNetworkInfo;
  CartRepository({
    required this.baseCartRemoteDatasource,
    required this.baseNetworkInfo,
  });
}
