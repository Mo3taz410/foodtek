import 'package:flutter/material.dart';
import 'package:foodtek/core/theme/app_colors/app_light_colors.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
import 'package:foodtek/features/app/models/notification_model.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(context, 30),
          vertical: responsiveHeight(context, 30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppLightColors.octonary,
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
            SizedBox(height: responsiveHeight(context, 30)),
            Text(
              context.l10n.checkout,
              style: AppTextStyles.appTitle,
            ),
          ],
        ),
      ),
    );
  }
}
