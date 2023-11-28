import 'package:ecommerce_app/App/presentation/controller/app_cubit.dart';
import 'package:ecommerce_app/App/presentation/layout/home_layout.dart';
import 'package:ecommerce_app/Authentication/presentation/controller/auth_cubit.dart';
import 'package:ecommerce_app/Authentication/presentation/screens/login_screen.dart';
import 'package:ecommerce_app/Cart/presentation/components/cart_cubit.dart';
import 'package:ecommerce_app/Core/Services/service_locator.dart';
import 'package:ecommerce_app/Core/Themes/app_themes/light_theme.dart';
import 'package:ecommerce_app/store/presentation/controller/store_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthenticationCubit>()),
        BlocProvider(create: (context) => sl<StoreCubit>()),
        BlocProvider(create: (context) => sl<AppCubit>()),
        BlocProvider(create: (context) => sl<CartCubit>()),
      ],
      child: MaterialApp(
        title: 'Material App',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        // home: const LoginScreen(),
        home: const HomeLayout(),
      ),
    );
  }
}
