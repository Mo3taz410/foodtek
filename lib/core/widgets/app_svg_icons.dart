import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodtek/core/utils/responsive.dart';

import '../utils/app_colors.dart';

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
      colorFilter: ColorFilter.mode(
        color ?? AppColors.tertiary,
        BlendMode.srcIn,
      ),
      width: width ?? responsiveWidth(context, 22),
      height: height ?? responsiveWidth(context, 22),
    );
  }
}
