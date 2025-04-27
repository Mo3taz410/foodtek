import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodtek/core/constants/app_animation_strings.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/core/widgets/app_custom_text_field.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
import 'package:lottie/lottie.dart';
import '../widgets/auth_screen_wrapper.dart';

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
              ),
            ],
          ),
          Column(
            spacing: responsiveHeight(context, 12),
            children: [
              Text(
                context.l10n.reset_password,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                context.l10n.reset_password_description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          AppCustomTextField(
            controller: emailController,
            hintText: context.l10n.email,
            label: context.l10n.email,
            keyboardType: TextInputType.emailAddress,
          ),
          AppCustomButton(
            text: context.l10n.send,
            width: double.infinity,
            height: responsiveHeight(context, 48),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
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
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: List.generate(4, (index) {
                                    return SizedBox(
                                      width: responsiveWidth(context, 60),
                                      height: responsiveHeight(context, 70),
                                      child: Center(
                                        child: TextField(
                                          keyboardType: TextInputType.number,
                                          textAlign: TextAlign.center,
                                          maxLength: 1,
                                          decoration: InputDecoration(
                                            counterText: '',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .outline,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                AppCustomButton(
                                  text: context.l10n.verify,
                                  width: double.infinity,
                                  height: responsiveHeight(context, 48),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/new_password');
                                  },
                                ),
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
          ),
        ],
      ),
    );
  }
}
