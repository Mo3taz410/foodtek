import 'package:flutter/material.dart';
import 'package:foodtek/core/constants/app_image_strings.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/models/food_model.dart';
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
        color: Theme.of(context).colorScheme.secondary,
        image: DecorationImage(
          image: AssetImage(AppImageStrings.checkoutBackgroundPattern),
          fit: BoxFit.cover,
        ),
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
            context,
            context.l10n.total,
            '\$${total.toStringAsFixed(2)}',
            isBold: true,
          ),
          const SizedBox(height: 16),
          AppCustomButton(
            text: context.l10n.place_order,
            onPressed: () {
              Navigator.pushNamed(context, '/checkout');
            },
            width: responsiveWidth(context, 360),
            height: responsiveHeight(context, 50),
          ),
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
          Text(
            label,
            style: (isBold
                    ? Theme.of(context).textTheme.titleMedium
                    : Theme.of(context).textTheme.bodyMedium)
                ?.copyWith(color: Colors.white),
          ),
          Text(
            value,
            style: (isBold
                    ? Theme.of(context).textTheme.titleMedium
                    : Theme.of(context).textTheme.bodyMedium)
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
