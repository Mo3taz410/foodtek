import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/constants/app_animation_strings.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/features/cart/controllers/cart_cubit.dart';
import 'cart_summary_box.dart';

class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, List<FoodModel>>(
      builder: (context, cartItems) {
        if (cartItems.isEmpty) {
          return _buildEmptyState(
            context,
            title: context.l10n.cart_empty,
            subtitle: context.l10n.cart_empty_message,
          );
        }

        return Stack(
          children: [
            ListView.builder(
              padding: const EdgeInsets.only(bottom: 220),
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Dismissible(
                  key: Key(item.id),
                  direction: DismissDirection.endToStart,
                  background: _buildSwipeDelete(context),
                  confirmDismiss: (_) async {
                    return await _showRemoveDialog(context);
                  },
                  onDismissed: (_) {
                    context.read<CartCubit>().removeCompletely(item);
                  },
                  child: _buildCartItem(context, item),
                );
              },
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: CartSummaryBox(cartItems: cartItems),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSwipeDelete(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Container(
      alignment: isRtl ? Alignment.centerLeft : Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 20)),
      margin: EdgeInsets.all(responsiveHeight(context, 20)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: AppSvgIcons(iconPath: AppIconStrings.delete),
    );
  }

  Widget _buildCartItem(BuildContext context, FoodModel food) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.all(responsiveHeight(context, 20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 22)),
        child: Row(
          children: [
            Image.asset(
              food.image,
              width: responsiveWidth(context, 62),
              height: responsiveHeight(context, 62),
              fit: BoxFit.cover,
            ),
            SizedBox(width: responsiveWidth(context, 20)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.name,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  Text(
                    '\$${food.currentPrice.toStringAsFixed(2)}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    final newQty =
                        (food.inCartQuantity > 1) ? food.inCartQuantity - 1 : 1;
                    context.read<CartCubit>().updateQuantity(food, newQty);
                  },
                ),
                Text('${food.inCartQuantity}',
                    style: Theme.of(context).textTheme.bodyMedium),
                IconButton(
                  icon: Icon(
                    Icons.add,
                  ),
                  onPressed: () {
                    context
                        .read<CartCubit>()
                        .updateQuantity(food, food.inCartQuantity + 1);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> _showRemoveDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 24),
              vertical: responsiveHeight(context, 24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  context.l10n.remove_from_cart,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: responsiveHeight(context, 30)),
                AppCustomButton(
                  text: context.l10n.yes,
                  textStyle: Theme.of(context).textTheme.labelMedium,
                  width: double.infinity,
                  height: responsiveHeight(context, 48),
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context,
      {required String title, required String subtitle}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppAnimationStrings.emptyCart, repeat: false),
            const SizedBox(height: 24),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
