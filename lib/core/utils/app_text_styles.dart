import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/core/utils/app_colors.dart';

class AppTextStyles {
  static final TextStyle logo = TextStyle(
    fontSize: 80.sp,
    color: AppColors.quinary,
    fontFamily: 'ProtestRiot',
  );

  static TextStyle onboardingTitle(int index) => TextStyle(
        fontSize: 32.sp,
        color: AppColors.secondary,
        fontFamily: 'Poppins',
        fontWeight: index == 3 ? FontWeight.w700 : FontWeight.w500,
      );

  static final TextStyle onboardingSubTitle = TextStyle(
    fontSize: 16.sp,
    color: AppColors.secondary,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static final TextStyle onboardingButton = TextStyle(
    fontSize: 16.sp,
    color: AppColors.quinary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  static final TextStyle onboardingSkipButton = TextStyle(
    fontSize: 16.sp,
    color: AppColors.secondary,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static final TextStyle authTitle = TextStyle(
    fontSize: 32.sp,
    color: AppColors.secondary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static final TextStyle authSubTitle = TextStyle(
    fontSize: 12.sp,
    color: AppColors.secondary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static final TextStyle authButton = TextStyle(
    fontSize: 14.sp,
    color: AppColors.quinary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static final TextStyle authSocialButton = TextStyle(
    fontSize: 14.sp,
    color: AppColors.secondary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  static final TextStyle authTextFieldsHint = TextStyle(
    fontSize: 14.sp,
    color: AppColors.primary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static final TextStyle topRatedFoodName = TextStyle(
    fontSize: 14.sp,
    color: AppColors.primary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
}
