import 'package:flutter/material.dart';

class SnackbarMessage {
  void showSuccessSnackBar({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void showErrorSnackBar({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
