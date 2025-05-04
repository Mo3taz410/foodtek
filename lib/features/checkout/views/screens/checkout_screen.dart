import 'package:flutter/material.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
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
                  width: responsiveWidth(context, 34),
                  height: responsiveHeight(context, 34),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: IconButton(
                    icon:
                        AppSvgIcons(iconPath: AppIconStrings.notificationsBell),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (_) => const NotificationModal(),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: responsiveHeight(context, 30)),
            Text(
              context.l10n.checkout,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: responsiveHeight(context, 20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: responsiveHeight(context, 20), // for now,,,,,,
              children: [
                Text(
                  context.l10n.delivery_path,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                AppSvgIcons(
                  iconPath: AppIconStrings.restaurentLocation,
                  color: Theme.of(context).colorScheme.primary,
                ),
                AppSvgIcons(
                  iconPath: AppIconStrings.userLocation,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
