import 'package:flutter/material.dart';
import 'package:holo_cart/core/themes/app_colors.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
      primaryColor: AppColors.primaryOrangeColor,
      scaffoldBackgroundColor: AppColors.lightBackgroundColor,
      fontFamily: "Cairo",
      disabledColor: Colors.amberAccent,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.lightBackgroundColor,
      ));

  static final ThemeData darkMode = ThemeData(
      primaryColor: AppColors.primaryOrangeColor,
      scaffoldBackgroundColor: AppColors.darkBackgroundColor,
      fontFamily: "Cairo",
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.darkBackgroundColor,
      ));
}
