import 'package:flutter/material.dart';

Future navigateAndFinish(BuildContext context, Widget screen) async {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => screen),
    (route) => false,
  );
}
