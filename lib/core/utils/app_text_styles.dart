import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/core/theme/app_colors/app_light_colors.dart';

class AppTextStyles {
  static final TextStyle logo = TextStyle(
    fontSize: 80.sp,
    color: AppLightColors.primary,
    fontFamily: 'ProtestRiot',
  );

  static TextStyle onboardingTitle = TextStyle(
    fontSize: 32.sp,
    color: AppLightColors.secondary,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
  );

  static final TextStyle onboardingSubTitle = TextStyle(
    fontSize: 16.sp,
    color: AppLightColors.secondary,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static final TextStyle onboardingButton = TextStyle(
    fontSize: 16.sp,
    color: AppLightColors.quinary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  static final TextStyle onboardingSkipButton = TextStyle(
    fontSize: 16.sp,
    color: AppLightColors.secondary,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static final TextStyle appTitle = TextStyle(
    fontSize: 32.sp,
    color: AppLightColors.secondary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static final TextStyle appSubTitle = TextStyle(
    fontSize: 12.sp,
    color: AppLightColors.secondary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static final TextStyle appButton = TextStyle(
    fontSize: 14.sp,
    color: AppLightColors.quinary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static final TextStyle authSocialButton = TextStyle(
    fontSize: 14.sp,
    color: AppLightColors.secondary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  static final TextStyle appTextFieldsHint = TextStyle(
    fontSize: 14.sp,
    color: AppLightColors.tertiary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static final TextStyle tabBarItemTitle = TextStyle(
    fontSize: 14.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );
  static final TextStyle topRated = TextStyle(
    fontSize: 20.sp,
    color: AppLightColors.secondary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  static final TextStyle topRatedFoodName = TextStyle(
    fontSize: 14.sp,
    color: AppLightColors.secondary,
    fontFamily: 'Avenir',
  );
  static final TextStyle topRatedFoodDescription = TextStyle(
    fontSize: 8.sp,
    color: AppLightColors.secondary,
    fontFamily: 'Avenir',
  );
  static final TextStyle foodCardFoodName = TextStyle(
    fontSize: 10.sp,
    color: AppLightColors.secondary,
    fontFamily: 'Sora',
    fontWeight: FontWeight.w600,
  );
  static final TextStyle foodCardFoodDescription = TextStyle(
    fontSize: 10.sp,
    color: AppLightColors.secondary,
    fontFamily: 'Sora',
    fontWeight: FontWeight.w300,
  );
  static final TextStyle foodCardButton = TextStyle(
    fontSize: 10.sp,
    color: AppLightColors.quinary,
    fontFamily: 'Sora',
    fontWeight: FontWeight.w400,
  );
}
