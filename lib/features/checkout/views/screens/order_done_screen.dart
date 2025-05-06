import 'package:flutter/material.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/constants/app_image_strings.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/models/notification_model.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';

import '../../../../core/widgets/app_custom_button.dart';

class OrderDoneScreen extends StatelessWidget {
  const OrderDoneScreen({super.key});

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
          spacing: responsiveHeight(context, 30),
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
                    icon: AppSvgIcons(
                      iconPath: AppIconStrings.notificationsBell,
                    ),
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
            Row(
              spacing: responsiveWidth(context, 20),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: AppSvgIcons(
                    iconPath: AppIconStrings.leftLongArrow,
                    width: responsiveWidth(context, 12),
                    height: responsiveHeight(context, 12),
                  ),
                ),
                Text(
                  context.l10n.checkout,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            SizedBox(
              height: responsiveHeight(context, 100),
            ),
            Image.asset(
              AppImageStrings.visaCard,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    context.l10n.order_done_successfully,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: responsiveHeight(context, 10),
                  ),
                  Text(
                    context.l10n.order_done_description,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            AppCustomButton(
              text: context.l10n.track_your_order,
              onPressed: () {},
              height: responsiveHeight(context, 50),
            ),
          ],
        ),
      ),
    );
  }
}
