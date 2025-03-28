import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_image_strings.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:universal_platform/universal_platform.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../l10n/app_localizations.dart';

class SocialAuthButtons extends StatelessWidget {
  final VoidCallback? onGoogleTap;
  final VoidCallback? onFacebookTap;
  final VoidCallback? onAppleTap;

  const SocialAuthButtons({
    super.key,
    this.onGoogleTap,
    this.onFacebookTap,
    this.onAppleTap,
  });

  Widget _buildButton({
    required BuildContext context,
    required String iconPath,
    required String label,
    required VoidCallback? onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: responsiveHeight(context, 48),
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Image.asset(
          iconPath,
          height: responsiveTextSize(context, 18),
        ),
        label: Text(
          label,
          style: AppTextStyles.authSocialButton(context),
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: AppColors.secondary.withOpacity(0.2)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: responsiveHeight(context, 13),
      children: [
        _buildButton(
          context: context,
          iconPath: AppImageStrings.google,
          label: AppLocalizations.of(context)!.continue_google,
          onTap: onGoogleTap,
        ),
        _buildButton(
          context: context,
          iconPath: AppImageStrings.facebook,
          label: AppLocalizations.of(context)!.continue_facebook,
          onTap: onFacebookTap,
        ),
        if (UniversalPlatform.isIOS)
          _buildButton(
            context: context,
            iconPath: AppImageStrings.apple,
            label: AppLocalizations.of(context)!.continue_apple,
            onTap: onAppleTap,
          ),
      ],
    );
  }
}
