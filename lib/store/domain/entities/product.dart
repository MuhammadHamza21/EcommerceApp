// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/store/domain/entities/brand.dart';
import 'package:ecommerce_app/store/domain/entities/category.dart';
import 'package:ecommerce_app/store/domain/entities/units.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int productId;
  final String barcode;
  final String productName;
  final String description;
  final Brand brand;
  final Category category;
  final List<Units> units;
  final String buyingPrice;
  final double price;
  final double priceAfterDiscount;
  final String currencyCode;
  final String tax;
  final String discount;
  final bool isOffer;
  final List<dynamic> images;
  final bool isFavourite;
  const Product({
    required this.productId,
    required this.barcode,
    required this.productName,
    required this.description,
    required this.brand,
    required this.category,
    required this.units,
    required this.buyingPrice,
    required this.price,
    required this.priceAfterDiscount,
    required this.currencyCode,
    required this.tax,
    required this.discount,
    required this.isOffer,
    required this.images,
    required this.isFavourite,
  });

  @override
  List<Object?> get props => [
        productId,
        barcode,
        productName,
        description,
        brand,
        category,
        units,
        buyingPrice,
        price,
        priceAfterDiscount,
        currencyCode,
        tax,
        discount,
        isOffer,
        images,
        isFavourite,
      ];
}
