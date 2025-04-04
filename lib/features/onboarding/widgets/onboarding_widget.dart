import 'package:flutter/material.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:lottie/lottie.dart';

import '../../auth/views/screens/login_screen.dart';

class OnboardingWidget extends StatelessWidget {
  final String animationPath;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;
  final bool isLast;

  const OnboardingWidget({
    super.key,
    required this.animationPath,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    this.isLast = false,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, 30),
      ),
      child: Column(
        spacing: responsiveHeight(context, 50),
        children: [
          Column(
            spacing: responsiveHeight(context, 50),
            children: [
              Lottie.asset(
                animationPath,
                fit: BoxFit.contain,
                width: responsiveWidth(context, 330),
                height: responsiveHeight(context, 220),
              ),
              SizedBox(
                height: responsiveHeight(context, 250),
                child: Column(
                  spacing: responsiveHeight(context, 20),
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.onboardingTitle(isLast ? 3 : 0),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      subtitle,
                      style: AppTextStyles.onboardingSubTitle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            spacing: responsiveHeight(context, 10),
            children: [
              AppCustomButton(
                text:
                    isLast ? context.l10n.yes_turn_on : context.l10n.continue_,
                textStyle: AppTextStyles.onboardingButton,
                width: responsiveWidth(context, 307),
                height: responsiveHeight(context, 48),
                borderRadius: 69,
                gradient: const LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.tertiary,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                onPressed: onPressed,
              ),
              if (isLast) ...[
                AppCustomButton(
                  text: context.l10n.cancel,
                  textStyle: AppTextStyles.onboardingButton.copyWith(
                    color: AppColors.secondary,
                  ),
                  width: responsiveWidth(context, 307),
                  height: responsiveHeight(context, 48),
                  color: AppColors.quinary,
                  borderRadius: 69,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginScreen(),
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
