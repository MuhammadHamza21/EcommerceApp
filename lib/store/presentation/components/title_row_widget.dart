import 'package:flutter/material.dart';

class TitleRowWidget extends StatelessWidget {
  const TitleRowWidget({
    Key? key,
    required this.title,
    required this.onSeeAllPressed,
  }) : super(key: key);

  final String title;
  final Function() onSeeAllPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: onSeeAllPressed,
          child: const Text(
            "See All",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
