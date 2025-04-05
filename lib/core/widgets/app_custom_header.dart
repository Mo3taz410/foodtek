import 'package:flutter/material.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_icon_strings.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';

import '../../features/app/models/notification_model.dart';
import '../../features/location/views/screen/location_picker_screen.dart';
import 'app_svg_icons.dart';

class AppCustomHeader extends StatelessWidget {
  final String placeName;
  final VoidCallback? onTap;

  const AppCustomHeader({
    super.key,
    required this.placeName,
    this.onTap,
  });

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
                        onPressed: onTap,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: responsiveWidth(context, 4),
                          children: [
                            Text(
                              'Current location',
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
                      Text(
                        placeName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
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
