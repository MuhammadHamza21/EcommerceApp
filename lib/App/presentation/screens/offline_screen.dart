import 'package:flutter/material.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.signal_wifi_connected_no_internet_4_rounded,
            color: Colors.grey,
            size: 100,
          ),
          Text(
            "No Internet Connection",
          ),
        ],
      ),
    );
  }
}
