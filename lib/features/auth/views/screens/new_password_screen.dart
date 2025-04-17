import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/core/constants/app_animation_strings.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/core/widgets/app_custom_text_field.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
import 'package:foodtek/features/auth/views/widgets/auth_bottom_text_row.dart';
import '../widgets/auth_screen_wrapper.dart';
import 'package:lottie/lottie.dart';

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
                icon: AppSvgIcons(
                  iconPath: AppIconStrings.leftLongArrow,
                  width: responsiveWidth(context, 12),
                  height: responsiveHeight(context, 12),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          Text(
            context.l10n.reset_password,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          AuthBottomTextRow(
            label: context.l10n.remember_password,
            actionText: context.l10n.log_in,
            onPressed: () => Navigator.pushNamed(context, '/login'),
          ),
          AppCustomTextField(
            controller: newPasswordController,
            hintText: context.l10n.new_password,
            label: context.l10n.new_password,
          ),
          AppCustomTextField(
            controller: confirmNewPasswordController,
            hintText: context.l10n.confirm_new_password,
            label: context.l10n.confirm_new_password,
          ),
          AppCustomButton(
            text: context.l10n.update_password,
            textStyle: Theme.of(context).textTheme.labelMedium,
            width: double.infinity,
            height: responsiveHeight(context, 48),
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
                          color: Colors.black.withValues(alpha: .3),
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
                              width: responsiveWidth(context, 200),
                              height: responsiveHeight(context, 200),
                            ),
                            Text(
                              context.l10n.congratulations,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            Text(
                              context.l10n.password_reset_success,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
