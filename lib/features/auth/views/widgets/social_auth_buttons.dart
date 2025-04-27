import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:foodtek/core/constants/app_image_strings.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/utils/responsive.dart';

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
        icon: Image.asset(iconPath, height: 18.sp),
        label: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          side: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.outline,
          ),
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
