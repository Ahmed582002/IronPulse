import 'package:flutter/material.dart';
import 'package:iron_pulse/core/constants/colors.dart';

class AppTheme {
  static final theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.primary),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontFamily: "Lexend",
        fontWeight: FontWeight.w700,
        color: AppColors.headText,
      ),
      displayMedium: TextStyle(
        fontFamily: "Lexend",
        fontWeight: FontWeight.w400,
        color: AppColors.bodyText,
      ),
    ),
  );
}
