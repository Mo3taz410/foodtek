import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/core/theme/app_colors/app_light_colors.dart';

class AppTextThemes {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 80.sp,
      fontFamily: 'ProtestRiot',
      color: AppLightColors.onPrimary,
    ),
    headlineMedium: TextStyle(
      fontSize: 32.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      fontSize: 24.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      color: Color(0xFF6C7278), // change this
    ),
    displayMedium: TextStyle(
      fontSize: 18.sp,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.w600,
    ),
    displaySmall: TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.w400,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 80.sp,
      fontFamily: 'ProtestRiot',
      color: AppLightColors.onPrimary,
    ),
    headlineMedium: TextStyle(
      fontSize: 32.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      fontSize: 24.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Sora',
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    ),
    labelSmall: TextStyle(
      fontSize: 10.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      fontSize: 18.sp,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.w600,
    ),
    displaySmall: TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Avenir',
      fontWeight: FontWeight.w400,
    ),
  );
}
