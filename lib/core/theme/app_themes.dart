import 'package:flutter/material.dart';
import 'package:foodtek/core/theme/app_colors/app_dark_colors.dart';
import 'package:foodtek/core/theme/app_colors/app_light_colors.dart';
import 'custom_themes/app_text_themes.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    textTheme: AppTextThemes.lightTextTheme,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppLightColors.primary,
      onPrimary: AppLightColors.onPrimary,
      secondary: AppLightColors.secondary,
      onSecondary: AppLightColors.onSecondary,
      surface: AppLightColors.surface,
      onSurface: AppLightColors.textTitle,
      background: AppLightColors.scaffold,
      onBackground: AppLightColors.textBody,
      error: AppLightColors.error,
      onError: AppLightColors.onError,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppLightColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppLightColors.textHint),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppLightColors.primary),
      ),
      hintStyle: AppTextThemes.lightTextTheme.bodySmall?.copyWith(
        color: AppLightColors.textHint,
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppLightColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      titleTextStyle: AppTextThemes.lightTextTheme.titleLarge,
      contentTextStyle: AppTextThemes.lightTextTheme.bodyMedium,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      fillColor: WidgetStateProperty.all(AppLightColors.primary),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppLightColors.primary,
      unselectedItemColor: AppLightColors.primary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    textTheme: AppTextThemes.darkTextTheme,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppDarkColors.primary,
      onPrimary: AppDarkColors.onPrimary,
      secondary: AppDarkColors.secondary,
      onSecondary: AppDarkColors.onSecondary,
      surface: AppDarkColors.surface,
      onSurface: AppDarkColors.textTitle,
      background: AppDarkColors.scaffold,
      onBackground: AppDarkColors.textBody,
      error: AppDarkColors.error,
      onError: AppDarkColors.onError,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppDarkColors.surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppDarkColors.textHint),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppDarkColors.primary),
      ),
      hintStyle: AppTextThemes.darkTextTheme.bodySmall?.copyWith(
        color: AppDarkColors.textHint,
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: AppDarkColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      titleTextStyle: AppTextThemes.darkTextTheme.titleLarge,
      contentTextStyle: AppTextThemes.darkTextTheme.bodyMedium,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      fillColor: WidgetStateProperty.all(AppDarkColors.primary),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppDarkColors.primary,
      unselectedItemColor: AppLightColors.primary,
    ),
  );
}
