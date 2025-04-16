import 'package:flutter/material.dart';
import 'package:foodtek/core/theme/app_colors/app_dark_colors.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';

class AppTextThemes {
  static TextTheme lightTextTheme = TextTheme(
    // Logo and onboarding
    headlineLarge: AppTextStyles.logo,
    headlineMedium: AppTextStyles.onboardingTitle,
    headlineSmall: AppTextStyles.onboardingSubTitle,

    // Main titles and buttons
    titleLarge: AppTextStyles.appTitle,
    titleMedium: AppTextStyles.appSubTitle,
    titleSmall: AppTextStyles.tabBarItemTitle,

    // Body text
    bodyLarge: AppTextStyles.topRated,
    bodyMedium: AppTextStyles.topRatedFoodName,
    bodySmall: AppTextStyles.topRatedFoodDescription,

    // Labels, buttons, fields
    labelLarge: AppTextStyles.onboardingButton,
    labelMedium: AppTextStyles.appButton,
    labelSmall: AppTextStyles.foodCardButton,
  );

  static TextTheme darkTextTheme = TextTheme(
    // Logo and onboarding
    headlineLarge: AppTextStyles.logo.copyWith(color: AppDarkColors.quinary),
    headlineMedium:
        AppTextStyles.onboardingTitle.copyWith(color: AppDarkColors.secondary),
    headlineSmall: AppTextStyles.onboardingSubTitle
        .copyWith(color: AppDarkColors.tertiary),

    // Main titles and buttons
    titleLarge: AppTextStyles.appTitle.copyWith(color: AppDarkColors.quinary),
    titleMedium:
        AppTextStyles.appSubTitle.copyWith(color: AppDarkColors.secondary),
    titleSmall:
        AppTextStyles.tabBarItemTitle.copyWith(color: AppDarkColors.secondary),

    // Body text
    bodyLarge: AppTextStyles.topRated.copyWith(color: AppDarkColors.secondary),
    bodyMedium:
        AppTextStyles.topRatedFoodName.copyWith(color: AppDarkColors.tertiary),
    bodySmall: AppTextStyles.topRatedFoodDescription
        .copyWith(color: AppDarkColors.senary),

    // Labels, buttons, fields
    labelLarge: AppTextStyles.onboardingButton
        .copyWith(color: AppDarkColors.quaternary),
    labelMedium:
        AppTextStyles.appButton.copyWith(color: AppDarkColors.quaternary),
    labelSmall:
        AppTextStyles.foodCardButton.copyWith(color: AppDarkColors.quaternary),
  );
}
