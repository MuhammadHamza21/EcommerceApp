import 'package:equatable/equatable.dart';

class Units extends Equatable {
  final int id;
  final String unitName;
  final double tax;
  final double price;
  final double priceWithoutTax;
  final double priceAfterDiscount;
  final double discount;
  final String currencyCode;
  const Units({
    required this.id,
    required this.unitName,
    required this.tax,
    required this.price,
    required this.priceWithoutTax,
    required this.priceAfterDiscount,
    required this.discount,
    required this.currencyCode,
  });
  @override
  List<Object?> get props => [
        id,
        unitName,
        tax,
        price,
        priceWithoutTax,
        priceAfterDiscount,
        discount,
        currencyCode,
      ];
}
