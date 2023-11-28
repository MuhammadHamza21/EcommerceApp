import 'package:flutter/material.dart';

Future navigateTo(BuildContext context, Widget screen) async {
  await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}
