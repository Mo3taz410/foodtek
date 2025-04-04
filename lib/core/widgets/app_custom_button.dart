import 'package:flutter/material.dart';
import 'package:foodtek/core/utils/app_colors.dart';

class AppCustomButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final Color? color;
  final Gradient? gradient;
  final double borderRadius;
  final double? width;
  final double? height;

  const AppCustomButton({
    super.key,
    required this.text,
    required this.textStyle,
    this.width,
    this.height,
    required this.onPressed,
    this.color,
    this.gradient,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: gradient == null ? color ?? AppColors.quaternary : null,
            gradient: gradient,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Center(
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
