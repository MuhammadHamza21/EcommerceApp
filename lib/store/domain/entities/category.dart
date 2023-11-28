import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String catName;
  final int itemsCount;
  final String image;
  const Category({
    required this.id,
    required this.catName,
    required this.itemsCount,
    required this.image,
  });
  @override
  List<Object?> get props => [
        id,
        catName,
        itemsCount,
        image,
      ];
}
