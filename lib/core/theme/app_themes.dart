import 'package:flutter/material.dart';
import 'package:foodtek/core/theme/app_colors/app_dark_colors.dart';
import 'app_colors/app_light_colors.dart';
import 'custom_themes/app_text_themes.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    primaryColor: AppLightColors.primary,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextThemes.lightTextTheme,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppLightColors.primary,
      onPrimary: Colors.white,
      secondary: AppLightColors.quaternary,
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      surface: Colors.white,
      onSurface: AppLightColors.secondary,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    primaryColor: AppDarkColors.primary,
    scaffoldBackgroundColor: AppDarkColors.primary,
    textTheme: AppTextThemes.darkTextTheme,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppDarkColors.primary,
      onPrimary: Colors.white,
      secondary: AppDarkColors.quaternary,
      onSecondary: AppDarkColors.septenary,
      surface: AppDarkColors.quinary,
      onSurface: AppDarkColors.senary,
      error: Colors.red.shade400,
      onError: Colors.black,
    ),
  );
}
