import 'package:flutter/material.dart';
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
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 4,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: AppSvgIcons(
              iconPath: AppIconStrings.cart,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          if (itemCount > 0)
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                child: Center(
                  child: Text(
                    itemCount > 99 ? '99+' : '$itemCount',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
