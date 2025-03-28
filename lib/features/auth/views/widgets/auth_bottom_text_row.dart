import 'package:flutter/material.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';

class AuthBottomTextRow extends StatelessWidget {
  final String label;
  final String actionText;
  final VoidCallback onPressed;

  const AuthBottomTextRow({
    super.key,
    required this.label,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: AppTextStyles.authSubTitle(context),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            actionText,
            style: AppTextStyles.authSubTitle(context).copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
