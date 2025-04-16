import 'package:flutter/material.dart';
import 'package:foodtek/core/theme/app_colors/app_light_colors.dart';

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const QuantityButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppLightColors.octonary,
        border: Border.all(color: AppLightColors.secondary),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(icon, color: AppLightColors.secondary),
        ),
      ),
    );
  }
}
