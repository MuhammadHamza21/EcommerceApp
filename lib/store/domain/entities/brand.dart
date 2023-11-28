import 'package:equatable/equatable.dart';

class Brand extends Equatable {
  final int id;
  final String brandName;
  final String image;
  const Brand({
    required this.id,
    required this.brandName,
    required this.image,
  });
  @override
  List<Object?> get props => [id, brandName, image];
}
