import 'package:flutter/material.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/core/widgets/app_custom_text_field.dart';
import '../../../../core/constants/app_icon_strings.dart';
import '../../../../core/constants/app_image_strings.dart';
import '../../../../core/models/notification_model.dart';
import '../../../../core/utils/responsive.dart';
import '../../../../core/widgets/app_svg_icons.dart';

class AddCardScreen extends StatelessWidget {
  final cardNumberController = TextEditingController();
  final nameController = TextEditingController();
  final expiryDateController = TextEditingController();
  final cvvController = TextEditingController();

  AddCardScreen({super.key});

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
                  context.l10n.add_card,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Image.asset(
              AppImageStrings.visaCard,
            ),
            AppCustomTextField(
              controller: nameController,
              hintText: 'Raya Daboor',
              label: context.l10n.name_on_card,
            ),
            AppCustomTextField(
              controller: cardNumberController,
              hintText: '6578 8756 4238 92764',
              label: context.l10n.card_number,
              suffixIcon: AppSvgIcons(
                iconPath: AppIconStrings.card,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppCustomTextField(
                    controller: expiryDateController,
                    hintText: '04/23',
                    label: context.l10n.expiry_date,
                    keyboardType: TextInputType.datetime,
                    textAllign: TextAlign.center,
                  ),
                ),
                SizedBox(width: responsiveWidth(context, 20)),
                Expanded(
                  child: AppCustomTextField(
                    controller: cvvController,
                    hintText: '875',
                    label: context.l10n.cvv,
                    keyboardType: TextInputType.number,
                    textAllign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Center(
              child: SizedBox(
                width: responsiveWidth(context, 235),
                height: responsiveHeight(context, 35),
                child: Text(
                  context.l10n.payment_success_note,
                  style: Theme.of(context).textTheme.labelSmall,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            AppCustomButton(
              text: context.l10n.pay_for_the_order,
              onPressed: () {
                Navigator.pushNamed(context, '/order_done');
              },
              height: responsiveHeight(context, 50),
            ),
          ],
        ),
      ),
    );
  }
}
