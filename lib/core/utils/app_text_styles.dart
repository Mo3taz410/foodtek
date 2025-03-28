import 'package:flutter/material.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/responsive.dart';

class AppTextStyles {
  static TextStyle logo(BuildContext context) {
    return TextStyle(
      fontSize: responsiveTextSize(context, 80),
      color: AppColors.quinary,
      fontFamily: 'ProtestRiot',
    );
  }

  static TextStyle onboardingTitle(BuildContext context, int index) {
    return TextStyle(
      fontSize: responsiveTextSize(context, 32),
      color: AppColors.secondary,
      fontFamily: 'Poppins',
      fontWeight: index == 3 ? FontWeight.w700 : FontWeight.w500,
    );
  }

  static TextStyle onboardingSubTitle(BuildContext context) {
    return TextStyle(
      fontSize: responsiveTextSize(context, 16),
      color: AppColors.secondary,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle onboardingButton(BuildContext context) {
    return TextStyle(
      fontSize: responsiveTextSize(context, 16),
      color: AppColors.quinary,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle onboardingSkipButton(BuildContext context) {
    return TextStyle(
      fontSize: responsiveTextSize(context, 16),
      color: AppColors.secondary,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle authTitle(BuildContext context) {
    return TextStyle(
      fontSize: responsiveTextSize(context, 32),
      color: AppColors.secondary,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle authSubTitle(BuildContext context) {
    return TextStyle(
      fontSize: responsiveTextSize(context, 12),
      color: AppColors.secondary,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle authButton(BuildContext context) {
    return TextStyle(
      fontSize: responsiveTextSize(context, 14),
      color: AppColors.quinary,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle authSocialButton(BuildContext context) {
    return TextStyle(
      fontSize: responsiveTextSize(context, 14),
      color: AppColors.secondary,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle authTextFieldsHintStyle(BuildContext context) {
    return TextStyle(
      fontSize: responsiveTextSize(context, 14),
      color: AppColors.primary,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    );
  }
}
