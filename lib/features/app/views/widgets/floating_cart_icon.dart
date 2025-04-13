import 'package:flutter/material.dart';
import 'package:foodtek/core/constants/app_colors.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';

class FloatingCartIcon extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const FloatingCartIcon({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      margin: EdgeInsets.only(top: 18),
      child: FloatingActionButton(
        onPressed: onTap,
        elevation: 0,
        backgroundColor: isSelected ? AppColors.primary : AppColors.secondary,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 4,
            color: AppColors.octonary,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: AppSvgIcons(
          iconPath: AppIconStrings.cart,
          color: Colors.white,
        ),
      ),
    );
  }
}
