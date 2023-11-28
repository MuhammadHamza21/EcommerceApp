import 'package:ecommerce_app/store/data/models/brand_model.dart';
import 'package:ecommerce_app/store/data/models/category_model.dart';
import 'package:ecommerce_app/store/data/models/units_model.dart';
import 'package:ecommerce_app/store/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.productId,
    required super.barcode,
    required super.productName,
    required super.description,
    required super.brand,
    required super.category,
    required super.units,
    required super.buyingPrice,
    required super.price,
    required super.priceAfterDiscount,
    required super.currencyCode,
    required super.tax,
    required super.discount,
    required super.isOffer,
    required super.images,
    required super.isFavourite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json["id"] ?? 0,
        barcode: json["barcode"] ?? "",
        productName: json["name"] ?? "",
        description: json["description"] ?? "",
        brand: BrandModel.fromJson(json["brand"]),
        category: CategoryModel.fromJson(json["category"]),
        units: List<UnitsModel>.from(
          (json["units"] as List).map((e) => UnitsModel.fromJson(e)),
        ),
        buyingPrice: json["buying_price"] ?? "0",
        price: json["price"] != null ? double.parse(json["price"]) : 0,
        priceAfterDiscount: json["price_after_discount"] != null
            ? double.parse(json["price_after_discount"])
            : 0,
        currencyCode: json["currency_code"] ?? "",
        tax: json["tax"] ?? "",
        discount: json["discount"] ?? "",
        isOffer: json["is_offer"] ?? false,
        images: json["images"] ?? [],
        isFavourite: json["is_favourite"] ?? false,
      );
}
