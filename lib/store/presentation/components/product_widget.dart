// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_app/Core/Constants/api_constants.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce_app/store/domain/entities/product.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              height: 150,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                ApiConstants.kMedia + product.images[0].toString(),
              ),
            ),
            Positioned(
              top: 7,
              right: 7,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: 30,
                  width: 30,
                  child: Icon(
                    product.isFavourite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        SizedBox(
          width: 110,
          child: Text(
            product.productName,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 110,
          child: Text(
            "${product.currencyCode} ${product.price.toStringAsFixed(2)}",
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
