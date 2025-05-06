import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/constants/app_image_strings.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/core/widgets/app_custom_text_field.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';

import '../../../../core/models/food_model.dart';
import '../../../../core/models/notification_model.dart';
import '../../../cart/controllers/cart_cubit.dart';
import '../../../../core/widgets/cart_summary_box.dart';
import '../../controllers/card_type_cubit.dart';
import '../../controllers/payment_method_cubit.dart';

class CheckoutScreen extends StatelessWidget {
  final promoCodeController = TextEditingController();
  CheckoutScreen({super.key});
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
            Column(
              spacing: responsiveHeight(context, 20),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.delivery_path,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                IntrinsicHeight(
                  child: Row(
                    spacing: responsiveWidth(context, 20),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        spacing: responsiveHeight(context, 5),
                        children: [
                          AppSvgIcons(
                            iconPath: AppIconStrings.restaurentLocation,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Container(
                            width: 1,
                            height: responsiveHeight(context, 25),
                            color: Colors.grey,
                          ),
                          AppSvgIcons(
                            iconPath: AppIconStrings.userLocation,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '88 Zurab Gorgiladze St',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              'Amman, Jordan',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            SizedBox(height: responsiveHeight(context, 20)),
                            Text(
                              '5 Noe Zhordania St',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Amman, Jordan',
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    context.l10n.change,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              spacing: responsiveHeight(context, 15),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.promo_code,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                AppCustomTextField(
                  controller: promoCodeController,
                  hintText: context.l10n.enter_your_promo_code,
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                  suffixIcon: AppCustomButton(
                    text: context.l10n.add,
                    onPressed: () {},
                    width: responsiveWidth(context, 90),
                    height: responsiveHeight(context, 40),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.payment_method,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                BlocBuilder<PaymentMethodCubit, PaymentMethod>(
                  builder: (context, selectedMethod) {
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () => context
                              .read<PaymentMethodCubit>()
                              .select(PaymentMethod.card),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<PaymentMethod>(
                                value: PaymentMethod.card,
                                groupValue: selectedMethod,
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                visualDensity: VisualDensity.compact,
                                onChanged: (val) {
                                  if (val != null) {
                                    context
                                        .read<PaymentMethodCubit>()
                                        .select(val);
                                  }
                                },
                              ),
                              Text(
                                context.l10n.card,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              SizedBox(width: responsiveWidth(context, 20)),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context
                              .read<PaymentMethodCubit>()
                              .select(PaymentMethod.cash),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio<PaymentMethod>(
                                value: PaymentMethod.cash,
                                groupValue: selectedMethod,
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                visualDensity: VisualDensity.compact,
                                onChanged: (val) {
                                  if (val != null) {
                                    context
                                        .read<PaymentMethodCubit>()
                                        .select(val);
                                  }
                                },
                              ),
                              Text(
                                context.l10n.cash,
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.card_type,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                BlocBuilder<CardTypeCubit, CardType?>(
                  builder: (context, selectedCard) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: responsiveWidth(context, 20),
                      children: [
                        GestureDetector(
                          onTap: () => context
                              .read<CardTypeCubit>()
                              .select(CardType.mastercard),
                          child: Row(
                            children: [
                              Radio<CardType>(
                                value: CardType.mastercard,
                                groupValue: selectedCard,
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                onChanged: (val) => context
                                    .read<CardTypeCubit>()
                                    .select(CardType.mastercard),
                              ),
                              Image.asset(
                                AppImageStrings.mastercard,
                                width: responsiveWidth(context, 27),
                                height: responsiveHeight(context, 18),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context
                              .read<CardTypeCubit>()
                              .select(CardType.visa),
                          child: Row(
                            children: [
                              Radio<CardType>(
                                value: CardType.visa,
                                groupValue: selectedCard,
                                activeColor:
                                    Theme.of(context).colorScheme.primary,
                                onChanged: (val) => context
                                    .read<CardTypeCubit>()
                                    .select(CardType.visa),
                              ),
                              Image.asset(
                                AppImageStrings.visa,
                                width: responsiveWidth(context, 27),
                                height: responsiveHeight(context, 18),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
            BlocBuilder<CartCubit, List<FoodModel>>(
              builder: (context, cartItems) {
                return CartSummaryBox(
                  cartItems: cartItems,
                  onPressed: () {
                    Navigator.pushNamed(context, '/add_card');
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
