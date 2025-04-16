import 'package:flutter/material.dart';
import 'package:foodtek/core/theme/app_colors/app_light_colors.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController controller;

  const AppSearchBar({
    super.key,
    required this.controller,
  });

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
          hintStyle: Theme.of(context).textTheme.labelMedium,
          prefixIcon: IconButton(
              onPressed: () {},
              icon: AppSvgIcons(iconPath: AppIconStrings.search)),
          suffixIcon: IconButton(
              onPressed: () {},
              icon: AppSvgIcons(iconPath: AppIconStrings.filterSearch)),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.only(
            left: responsiveWidth(context, 14),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: AppLightColors.secondary),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: AppLightColors.secondary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: AppLightColors.primary,
              width: responsiveWidth(context, 1.5),
            ),
          ),
        ),
      ),
    );
  }
}
