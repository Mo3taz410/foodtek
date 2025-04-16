import 'package:flutter/material.dart';
import 'package:foodtek/core/theme/app_colors/app_light_colors.dart';
import 'package:foodtek/core/constants/app_image_strings.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';

class CartSummaryBox extends StatelessWidget {
  final List<FoodModel> cartItems;

  const CartSummaryBox({
    super.key,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    final subtotal = cartItems.fold<double>(
      0,
      (sum, item) => sum + item.currentPrice * item.inCartQuantity,
    );

    const delivery = 10.0;
    const discount = 10.0;
    final total = subtotal + delivery - discount;

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImageStrings.checkoutBackgroundPattern),
          fit: BoxFit.cover,
        ),
        color: AppLightColors.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _summaryRow(context, context.l10n.sub_total,
              '\$${subtotal.toStringAsFixed(2)}'),
          _summaryRow(context, context.l10n.delivery_charge,
              '\$${delivery.toStringAsFixed(2)}'),
          _summaryRow(context, context.l10n.discount,
              '-\$${discount.toStringAsFixed(2)}'),
          const SizedBox(height: 12),
          _summaryRow(
              context, context.l10n.total, '\$${total.toStringAsFixed(2)}',
              isBold: true),
          const SizedBox(height: 16),
          AppCustomButton(
            text: context.l10n.place_order,
            textStyle:
                AppTextStyles.appButton.copyWith(color: AppLightColors.primary),
            onPressed: () {
              Navigator.pushNamed(context, '/checkout');
            },
            width: responsiveWidth(context, 360),
            height: responsiveHeight(context, 50),
            color: Colors.white,
          ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.white,
          //     foregroundColor: AppColors.secondary,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //   ),
          //   onPressed: () {
          //     ////// Navigator.pushNamed(context, '/location_picker');
          //     Navigator.pushNamed(context, '/checkout');
          //   },
          //   child: Text(context.l10n.place_order),
          // ),
        ],
      ),
    );
  }

  Widget _summaryRow(BuildContext context, String label, String value,
      {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                fontSize: isBold ? 18 : 14,
              )),
          Text(value,
              style: TextStyle(
                color: Colors.white,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                fontSize: isBold ? 18 : 14,
              )),
        ],
      ),
    );
  }
}
