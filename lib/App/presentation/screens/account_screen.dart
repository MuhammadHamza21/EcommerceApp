import 'package:ecommerce_app/App/presentation/controller/app_cubit.dart';
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
                final appCubit = AppCubit.get(context);
                appCubit.saveAccessToken("");
                appCubit.saveRefreshToken("");
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
