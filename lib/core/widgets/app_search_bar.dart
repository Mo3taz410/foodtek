import 'package:flutter/material.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_text_field.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';

class AppSearchBar extends StatelessWidget {
  final TextEditingController controller;

  const AppSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: responsiveWidth(context, 370),
      height: responsiveHeight(context, 45),
      child: AppCustomTextField(
        controller: controller,
        hintText: context.l10n.search_placeholder,
        hintStyle: Theme.of(context).textTheme.labelSmall,
        prefixIcon: IconButton(
          onPressed: () {},
          icon: AppSvgIcons(iconPath: AppIconStrings.search),
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: AppSvgIcons(iconPath: AppIconStrings.filterSearch),
        ),
      ),
    );
  }
}
