import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
import 'package:foodtek/features/app/views/widgets/app_custom_header.dart';
import 'package:foodtek/features/app/views/widgets/app_search_bar.dart';
import 'package:foodtek/features/cart/controllers/cart_cubit.dart';
import 'package:foodtek/features/food_details/controllers/food_details_cubit.dart';
import 'package:foodtek/features/food_details/views/widgets/quantity_button.dart';
import 'package:foodtek/features/food_details/views/widgets/stars_rating.dart';

import '../../../../core/constants/app_icon_strings.dart';
import '../widgets/slider_thumb_with_border.dart';

class FoodDetailsScreen extends StatelessWidget {
  final FoodModel food;

  const FoodDetailsScreen({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context, 30),
            vertical: responsiveHeight(context, 30),
          ),
          child: SingleChildScrollView(
            child: Column(
              spacing: responsiveHeight(context, 20),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppCustomHeader(),
                AppSearchBar(controller: TextEditingController()),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppSvgIcons(
                        iconPath: AppIconStrings.leftLongArrow,
                        width: responsiveWidth(context, 12),
                        height: responsiveHeight(context, 12),
                      ),
                      SizedBox(width: responsiveWidth(context, 10)),
                      Text(
                        context.l10n.back,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Image.asset(
                    food.image,
                    height: responsiveHeight(context, 180),
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Row(
                      children: [
                        StarsRating(rating: food.rating),
                        SizedBox(width: responsiveWidth(context, 6)),
                        Text(
                          '${food.rating} (89 ${context.l10n.reviews})',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${food.currentPrice.toStringAsFixed(2)}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        if (food.discountedPrice != null)
                          Padding(
                            padding: EdgeInsets.only(
                                left: responsiveWidth(context, 8)),
                            child: Text(
                              '\$${food.originalPrice.toStringAsFixed(2)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    decoration: TextDecoration.lineThrough,
                                  ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                Text(
                  food.description,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(height: responsiveHeight(context, 20)),
                BlocBuilder<FoodDetailsCubit, FoodDetailsState>(
                  builder: (context, state) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.spicy,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  thumbShape: SliderThumbWithBorder(),
                                  activeTrackColor: Color(0xFFEF2A39),
                                  inactiveTrackColor: Colors.grey.shade200,
                                  overlayColor:
                                      Color(0xFFEF2A39).withValues(alpha: .2),
                                ),
                                child: Slider(
                                  value: state.spiceLevel.toDouble(),
                                  min: 0,
                                  max: 4,
                                  divisions: 4,
                                  onChanged: (value) {
                                    context
                                        .read<FoodDetailsCubit>()
                                        .setSpiceLevel(value.toInt());
                                  },
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(context.l10n.mild,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: Color(0xFFEF2A39),
                                          )),
                                  Text(
                                    context.l10n.hot,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Color(0xFFEF2A39),
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: responsiveWidth(context, 85)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.l10n.quantity,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            SizedBox(
                              height: responsiveHeight(context, 12),
                            ),
                            Row(
                              children: [
                                QuantityButton(
                                  icon: Icons.remove,
                                  onTap: () => context
                                      .read<FoodDetailsCubit>()
                                      .decreaseQuantity(),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: responsiveWidth(context, 12),
                                  ),
                                  child: Text(
                                    '${state.quantity}',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ),
                                QuantityButton(
                                  color: Theme.of(context).colorScheme.primary,
                                  iconColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  icon: Icons.add,
                                  onTap: () => context
                                      .read<FoodDetailsCubit>()
                                      .increaseQuantity(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: responsiveHeight(context, 45)),
                AppCustomButton(
                  text: context.l10n.add_to_cart,
                  onPressed: () {
                    context.read<CartCubit>().addToCart(
                          food,
                          quantity:
                              context.read<FoodDetailsCubit>().state.quantity,
                        );
                  },
                  height: responsiveHeight(context, 48),
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
