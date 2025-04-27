import 'package:flutter/material.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:lottie/lottie.dart';

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
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontWeight: isLast ? null : FontWeight.w500,
                              ),
                    ),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
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
                width: responsiveWidth(context, 307),
                height: responsiveHeight(context, 48),
                borderRadius: 69,
                onPressed: onPressed,
              ),
              if (isLast)
                AppCustomButton(
                  text: context.l10n.cancel,
                  width: responsiveWidth(context, 307),
                  height: responsiveHeight(context, 48),
                  borderRadius: 69,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  color: Color(0xFFC2C2C2),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
