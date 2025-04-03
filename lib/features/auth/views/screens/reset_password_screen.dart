import 'package:flutter/material.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_animation_strings.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icon_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../widgets/auth_screen_wrapper.dart';
import '../widgets/auth_text_field.dart';
import 'new_password_screen.dart';
import 'dart:ui';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return AuthScreenWrapper(
      child: Column(
        spacing: responsiveHeight(context, 15),
        children: [
          Row(
            textDirection: TextDirection.ltr,
            children: [
              IconButton(
                icon: AppSvgIcons(
                  iconPath: AppIconStrings.leftLongArrow,
                  width: responsiveWidth(context, 12),
                  height: responsiveHeight(context, 12),
                ),
                onPressed: () => Navigator.pop(context),
              ),
              Text(
                context.l10n.back_to_login,
                style: AppTextStyles.authSubTitle,
              ),
            ],
          ),
          Column(
            spacing: responsiveHeight(context, 12),
            children: [
              Text(
                context.l10n.reset_password,
                style: AppTextStyles.authTitle,
                textAlign: TextAlign.center,
              ),
              Text(context.l10n.reset_password_description,
                  style: AppTextStyles.authSubTitle,
                  textAlign: TextAlign.center),
            ],
          ),
          AuthTextField(
            controller: emailController,
            hintText: context.l10n.email,
            hintStyle: AppTextStyles.authTextFieldsHint,
            keyboardType: TextInputType.emailAddress,
          ),
          AppCustomButton(
            text: context.l10n.send,
            textStyle: AppTextStyles.authButton,
            width: double.infinity,
            height: responsiveHeight(context, 48),
            color: AppColors.primary,
            onPressed: () {
              showDialog(
                context: context,
                // barrierDismissible: false,
                barrierColor: Colors.transparent,
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.black.withValues(alpha: .6),
                        ),
                      ),
                      Center(
                        child: Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: responsiveWidth(context, 24),
                              vertical: responsiveHeight(context, 24),
                            ),
                            child: Column(
                              spacing: responsiveHeight(context, 24),
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Lottie.asset(
                                  AppAnimationStrings.otpSent,
                                  repeat: false,
                                  fit: BoxFit.contain,
                                  width: responsiveWidth(context, 160),
                                  height: responsiveHeight(context, 160),
                                ),
                                Text(
                                  context.l10n.enter_code,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.authSubTitle,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(4, (index) {
                                    return SizedBox(
                                      width: 50,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        maxLength: 1,
                                        decoration: const InputDecoration(
                                          counterText: '',
                                          border: OutlineInputBorder(),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                AppCustomButton(
                                  text: context.l10n.verify,
                                  textStyle: AppTextStyles.authButton,
                                  color: AppColors.primary,
                                  width: double.infinity,
                                  height: responsiveHeight(context, 48),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              NewPasswordScreen(),
                                        ));
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
