import 'package:ecommerce_app/Core/Themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primaryColor,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
    ),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.primaryColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: AppColors.primaryColor,
      ),
    ),
  ),
);
