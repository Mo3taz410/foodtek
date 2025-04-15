import 'package:flutter/material.dart';
import 'package:foodtek/core/constants/app_colors.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';

class FloatingCartIcon extends StatelessWidget {
  final bool isSelected;
  final int itemCount;
  final VoidCallback onTap;

  const FloatingCartIcon({
    super.key,
    required this.isSelected,
    required this.itemCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      margin: const EdgeInsets.only(top: 18),
      child: Stack(
        alignment: Alignment.center,
        children: [
          FloatingActionButton(
            onPressed: onTap,
            elevation: 0,
            backgroundColor:
                isSelected ? AppColors.primary : AppColors.secondary,
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
          if (itemCount > 0)
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
                child: Center(
                  child: Text(
                    itemCount > 99 ? '99+' : '$itemCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
