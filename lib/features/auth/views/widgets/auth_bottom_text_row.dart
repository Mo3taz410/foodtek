import 'package:flutter/material.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';

import '../../../../core/constants/app_colors.dart';

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
          style: AppTextStyles.appSubTitle,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            actionText,
            style: AppTextStyles.appSubTitle.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
