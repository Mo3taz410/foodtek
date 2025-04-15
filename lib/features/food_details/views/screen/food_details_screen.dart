import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/constants/app_colors.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/features/app/views/widgets/app_custom_header.dart';
import 'package:foodtek/features/app/views/widgets/app_search_bar.dart';
import 'package:foodtek/features/cart/controllers/cart_cubit.dart';
import 'package:foodtek/features/food_details/controllers/food_details_cubit.dart';
import 'package:foodtek/features/food_details/views/widgets/quantity_button.dart';
import 'package:foodtek/features/food_details/views/widgets/stars_rating.dart';

class FoodDetailsScreen extends StatelessWidget {
  final FoodModel food;

  const FoodDetailsScreen({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context, 20),
            vertical: responsiveHeight(context, 12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppCustomHeader(),
                  AppSearchBar(controller: TextEditingController()),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    food.image,
                    height: responsiveHeight(context, 180),
                    fit: BoxFit.contain,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(food.name, style: AppTextStyles.appTitle),
                      Row(
                        children: [
                          StarsRating(rating: food.rating),
                          const SizedBox(width: 6),
                          Text('${food.rating} (89 ${context.l10n.reviews})',
                              style: AppTextStyles.appSubTitle),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '\$${food.currentPrice.toStringAsFixed(2)}',
                            style: AppTextStyles.appTitle,
                          ),
                          if (food.discountedPrice != null)
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                '\$${food.originalPrice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: responsiveHeight(context, 6)),
                        child: Text(
                          food.description,
                          style: AppTextStyles.appSubTitle,
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<FoodDetailsCubit, FoodDetailsState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(context.l10n.spicy,
                                      style: AppTextStyles.appSubTitle),
                                  Slider(
                                    value: state.spiceLevel.toDouble(),
                                    min: 0,
                                    max: 4,
                                    divisions: 4,
                                    onChanged: (value) {
                                      context
                                          .read<FoodDetailsCubit>()
                                          .setSpiceLevel(value.toInt());
                                    },
                                    activeColor: Colors.red,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(context.l10n.mild,
                                          style: const TextStyle(
                                              color: Colors.grey)),
                                      Text(context.l10n.hot,
                                          style: const TextStyle(
                                              color: Colors.red)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: responsiveWidth(context, 12)),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(context.l10n.quantity,
                                    style: AppTextStyles.appSubTitle),
                                Row(
                                  children: [
                                    QuantityButton(
                                      icon: Icons.remove,
                                      onTap: () => context
                                          .read<FoodDetailsCubit>()
                                          .decreaseQuantity(),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      child: Text('${state.quantity}',
                                          style: AppTextStyles.appSubTitle),
                                    ),
                                    QuantityButton(
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
                        ),
                      );
                    },
                  ),
                  AppCustomButton(
                    text: context.l10n.add_to_cart,
                    onPressed: () {
                      context.read<CartCubit>().addToCart(food,
                          quantity:
                              context.read<FoodDetailsCubit>().state.quantity);
                    },
                    color: AppColors.secondary,
                    height: responsiveHeight(context, 48),
                    width: double.infinity,
                    textStyle: AppTextStyles.appButton,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
