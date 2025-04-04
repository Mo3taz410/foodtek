import 'package:flutter/material.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_icon_strings.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';

import '../../features/app/models/notification_model.dart';
import 'app_svg_icons.dart';

class AppCustomHeader extends StatelessWidget {
  const AppCustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Row(
              spacing: responsiveWidth(context, 10),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: responsiveHeight(context, 8),
                    horizontal: responsiveWidth(context, 8),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.octonary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: AppSvgIcons(
                    iconPath: AppIconStrings.mapPinUnderlined,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: responsiveWidth(context, 4),
                          children: [
                            Text(
                              context.l10n.current_location,
                              style: AppTextStyles.authSubTitle,
                            ),
                            AppSvgIcons(
                              iconPath: AppIconStrings.dropDownCursor,
                              width: responsiveWidth(context, 6),
                              height: responsiveHeight(context, 6),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Jl. Soekarno Hatta 15A...',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // padding: EdgeInsets.symmetric(
                  //   vertical: responsiveHeight(context, 8),
                  //   horizontal: responsiveWidth(context, 8),
                  // ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.octonary,
                  ),
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (context) => const NotificationModal(),
                      );
                    },
                    icon:
                        AppSvgIcons(iconPath: AppIconStrings.notificationsBell),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
