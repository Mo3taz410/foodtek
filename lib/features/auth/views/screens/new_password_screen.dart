import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_animation_strings.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
import 'package:foodtek/features/auth/views/widgets/auth_bottom_text_row.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_icon_strings.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/utils/responsive.dart';
import '../widgets/auth_screen_wrapper.dart';
import '../widgets/auth_text_field.dart';
import 'login_screen.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newPasswordController = TextEditingController();
    final confirmNewPasswordController = TextEditingController();
    return AuthScreenWrapper(
      child: Column(
        spacing: responsiveHeight(context, 10),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                icon: AppSvgIcons(iconPath: AppIconStrings.leftLongArrow),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          Text(context.l10n.reset_password,
              style: AppTextStyles.authTitle(context)),
          AuthBottomTextRow(
            label: context.l10n.remember_password,
            actionText: context.l10n.log_in,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          ),
          AuthTextField(
            controller: newPasswordController,
            hintText: context.l10n.new_password,
            hintStyle: AppTextStyles.authTextFieldsHintStyle(context),
          ),
          AuthTextField(
            controller: confirmNewPasswordController,
            hintText: context.l10n.confirm_new_password,
            hintStyle: AppTextStyles.authTextFieldsHintStyle(context),
          ),
          AppCustomButton(
            text: context.l10n.update_password,
            textStyle: AppTextStyles.authButton(context),
            width: double.infinity,
            height: responsiveHeight(context, 48),
            color: AppColors.primary,
            onPressed: () {
              showGeneralDialog(
                context: context,
                barrierDismissible: false,
                barrierColor: Colors.transparent,
                pageBuilder: (_, __, ___) => Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Stack(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.black.withValues(alpha: 0.3),
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Lottie.asset(
                              AppAnimationStrings.success,
                              fit: BoxFit.contain,
                              width: responsiveWidth(
                                  context, 200), // Adjust according to design
                              height: responsiveHeight(context, 200),
                            ),
                            Text(
                              context.l10n.congratulations,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.authTitle(context).copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              context.l10n.password_reset_success,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.authSubTitle(context)
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize:
                                          responsiveTextSize(context, 16)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
