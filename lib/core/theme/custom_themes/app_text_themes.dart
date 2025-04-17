import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextThemes {
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 80.sp,
      fontFamily: 'ProtestRiot',
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 32.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    // subtitles
    headlineSmall: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Sora',
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontSize: 10.sp,
      fontFamily: 'Sora',
      fontWeight: FontWeight.w300,
      color: Colors.black,
    ),
    labelMedium: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    labelSmall: TextStyle(
      fontSize: 10.sp,
      fontFamily: 'Sora',
      fontWeight: FontWeight.w400,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 80.sp,
      fontFamily: 'ProtestRiot',
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 32.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    // subtitles
    headlineSmall: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 12.sp,
      fontFamily: 'Sora',
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 10.sp,
      fontFamily: 'Sora',
      fontWeight: FontWeight.w300,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 14.sp,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontSize: 10.sp,
      fontFamily: 'Sora',
      fontWeight: FontWeight.w400,
      color: Colors.white,
    ),
  );
}
