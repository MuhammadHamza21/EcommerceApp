import 'package:ecommerce_app/store/domain/entities/brand.dart';

class BrandModel extends Brand {
  const BrandModel({
    required super.id,
    required super.brandName,
    required super.image,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        id: json["id"] ?? 0,
        brandName: json["name"] ?? "",
        image: json["image"] ?? "",
      );
}
