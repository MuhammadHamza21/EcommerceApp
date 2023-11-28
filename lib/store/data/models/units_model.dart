import 'package:ecommerce_app/store/domain/entities/units.dart';

class UnitsModel extends Units {
  const UnitsModel({
    required super.id,
    required super.unitName,
    required super.tax,
    required super.price,
    required super.priceWithoutTax,
    required super.priceAfterDiscount,
    required super.discount,
    required super.currencyCode,
  });

  factory UnitsModel.fromJson(Map<String, dynamic> json) => UnitsModel(
        id: json["ID"] != null ? int.parse(json["ID"]) : 0,
        unitName: json["UnitName"] ?? "",
        tax: json["tax"] != null ? double.parse(json["tax"]) : 0,
        price: json["price"] != null ? double.parse(json["price"]) : 0,
        priceWithoutTax: json["price_without_tax"] != null
            ? double.parse(json["price_without_tax"])
            : 0,
        priceAfterDiscount: json["priceAfterDiscount"] != null
            ? double.parse(json["priceAfterDiscount"])
            : 0,
        discount: json["discount"] != null ? double.parse(json["discount"]) : 0,
        currencyCode: json["currency_code"] ?? "",
      );
}
