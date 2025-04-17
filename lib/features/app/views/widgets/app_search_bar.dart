import 'package:flutter/material.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController controller;

  const AppSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: responsiveWidth(context, 370),
      height: responsiveHeight(context, 45),
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: context.l10n.search_placeholder,
          prefixIcon: IconButton(
            onPressed: () {},
            icon: AppSvgIcons(iconPath: AppIconStrings.search),
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: AppSvgIcons(iconPath: AppIconStrings.filterSearch),
          ),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              width: responsiveWidth(context, 1.5),
            ),
          ),
        ),
      ),
    );
  }
}
