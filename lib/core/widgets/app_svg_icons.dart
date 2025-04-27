import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppSvgIcons extends StatelessWidget {
  final String iconPath;
  final Color? color;
  final double? width;
  final double? height;
  const AppSvgIcons({
    super.key,
    this.color,
    required this.iconPath,
    this.width,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconPath,
      width: width ?? 20,
      height: height ?? 20,
      colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).colorScheme.onSecondary,
        BlendMode.srcIn,
      ),
    );
  }
}
