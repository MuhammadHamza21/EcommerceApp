import 'package:ecommerce_app/store/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.catName,
    required super.itemsCount,
    required super.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"] ?? 0,
        catName: json["name"] ?? "",
        itemsCount: json["items_count"] ?? 0,
        image: json["image"] ?? "",
      );
}
