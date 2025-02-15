import 'package:flutter/material.dart';
import 'package:holo_cart/core/themes/app_colors.dart';

class AppTheme {
  static final ThemeData lightMode = ThemeData(
    primaryColor: AppColors.primaryOrangeColor,
    scaffoldBackgroundColor: AppColors.customPurpleColor,
    fontFamily: "Cairo",
    disabledColor: Colors.amberAccent,
    brightness: Brightness.light,

    // textTheme: TextTheme(
    //   bodyLarge: AppTextStyles.fontBodyLarge,
    //   bodySmall: AppTextStyles.fontBodySmall,
    //   bodyMedium: AppTextStyles.fontBodyMeduim,
    // ),
  );

  static final ThemeData darkMode = ThemeData(
    primaryColor: AppColors.primaryOrangeColor,
    scaffoldBackgroundColor: AppColors.customBlackColor.withOpacity(.7),
    fontFamily: "Cairo",
    brightness: Brightness.dark,
    // textTheme: TextTheme(
    //   bodyLarge: AppTextStyles.fontBodyLarge,
    //   bodySmall: AppTextStyles.fontBodySmall,
    //   bodyMedium: AppTextStyles.fontBodyMeduim,
    // ),
  );
}
