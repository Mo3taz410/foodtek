import 'package:flutter/material.dart';
import 'package:foodtek/core/theme/app_colors/app_dark_colors.dart';
import 'package:foodtek/core/theme/app_colors/app_light_colors.dart';
import 'package:foodtek/core/theme/custom_themes/app_card_themes.dart';
import 'custom_themes/app_text_themes.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppLightColors.primary,
      onPrimary: AppLightColors.onPrimary,
      secondary: AppLightColors.secondary,
      tertiary: AppLightColors.tertiary,
      onSecondary: AppLightColors.onSecondery,
      error: Colors.red, // keep in mind
      onError: Colors.white, // keep in mind
      surface: AppLightColors.surface, // keep in mind
      onSurface: AppLightColors.onSurface, // keep in mind
      outline: AppLightColors.outline,
    ),
    textTheme: AppTextThemes.lightTextTheme,
    cardTheme: AppCardThemes.lightCardTheme,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppLightColors.primary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: AppLightColors.secondary,
      unselectedItemColor: AppLightColors.onSecondery,
      selectedItemColor: AppLightColors.primary,
      selectedLabelStyle: AppTextThemes.lightTextTheme.bodySmall!
          .copyWith(color: AppLightColors.primary),
      unselectedLabelStyle: AppTextThemes.lightTextTheme.bodySmall!
          .copyWith(color: AppLightColors.onSecondery),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppLightColors.primary,
        textStyle: AppTextThemes.lightTextTheme.bodySmall,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppDarkColors.primary,
      onPrimary: AppDarkColors.onPrimary,
      secondary: AppDarkColors.secondary,
      tertiary: AppDarkColors.tertiary,
      onSecondary: AppDarkColors.onSecondery,
      error: Colors.red, // keep in mind
      onError: Colors.white, // keep in mind
      surface: AppDarkColors.surface, // keep in mind
      onSurface: AppDarkColors.onSurface, // keep in mind
      outline: AppDarkColors.outline,
    ),
    textTheme: AppTextThemes.darkTextTheme,
    cardTheme: AppCardThemes.darkCardTheme,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppDarkColors.primary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: AppDarkColors.secondary,
      unselectedItemColor: AppDarkColors.onSecondery,
      selectedItemColor: AppDarkColors.primary,
      selectedLabelStyle: AppTextThemes.darkTextTheme.bodySmall!
          .copyWith(color: AppDarkColors.primary),
      unselectedLabelStyle: AppTextThemes.darkTextTheme.bodySmall!
          .copyWith(color: AppDarkColors.onSecondery),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppDarkColors.onPrimary,
        textStyle: AppTextThemes.darkTextTheme.bodySmall,
      ),
    ),
  );
}
