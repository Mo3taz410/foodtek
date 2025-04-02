import 'package:flutter/material.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/responsive.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: responsiveWidth(context, 370),
      height: responsiveHeight(context, 42),
      child: TextField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            fillColor: Colors.white,
            filled: true,
            hintText: context.l10n.search_menu,
            hintStyle: TextStyle(color: AppColors.senary, fontSize: 16),
            prefixIcon: Icon(Icons.search, color: AppColors.senary, size: 22),
            suffixIcon: Icon(Icons.tune, color: AppColors.senary, size: 20),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
          )),
    );
  }
}
