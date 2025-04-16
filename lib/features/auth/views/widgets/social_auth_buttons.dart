import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:universal_platform/universal_platform.dart';
import '../../../../core/theme/app_colors/app_light_colors.dart';
import '../../../../core/constants/app_image_strings.dart';
import '../../../../core/utils/app_text_styles.dart';

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
          height: 18.sp,
        ),
        label: Text(
          label,
          style: AppTextStyles.authSocialButton,
        ),
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side:
              BorderSide(color: AppLightColors.secondary.withValues(alpha: .2)),
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
          label: context.l10n.continue_google,
          onTap: onGoogleTap,
        ),
        _buildButton(
          context: context,
          iconPath: AppImageStrings.facebook,
          label: context.l10n.continue_facebook,
          onTap: onFacebookTap,
        ),
        if (UniversalPlatform.isIOS)
          _buildButton(
            context: context,
            iconPath: AppImageStrings.apple,
            label: context.l10n.continue_apple,
            onTap: onAppleTap,
          ),
      ],
    );
  }
}
