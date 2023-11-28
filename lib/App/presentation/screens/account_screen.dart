import 'package:ecommerce_app/Authentication/presentation/screens/login_screen.dart';
import 'package:ecommerce_app/Core/utils/methods/navigate_and_finish.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                navigateAndFinish(context, const LoginScreen());
              },
              child: const Text("تسجيل الخروج"),
            ),
          ),
        ),
      ],
    );
  }
}
