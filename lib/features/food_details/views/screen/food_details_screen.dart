import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/models/food_model.dart';
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
            horizontal: responsiveWidth(context, 30),
            vertical: responsiveHeight(context, 20),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppCustomHeader(),
                SizedBox(height: responsiveHeight(context, 10)),
                AppSearchBar(controller: TextEditingController()),
                SizedBox(height: responsiveHeight(context, 20)),
                Center(
                  child: Image.asset(
                    food.image,
                    height: responsiveHeight(context, 180),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: responsiveHeight(context, 16)),
                Text(
                  food.name,
                ),
                SizedBox(height: responsiveHeight(context, 6)),
                Row(
                  children: [
                    StarsRating(rating: food.rating),
                    SizedBox(width: responsiveWidth(context, 6)),
                    Text(
                      '${food.rating} (89 ${context.l10n.reviews})',
                    ),
                  ],
                ),
                SizedBox(height: responsiveHeight(context, 12)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${food.currentPrice.toStringAsFixed(2)}',
                    ),
                    if (food.discountedPrice != null)
                      Padding(
                        padding:
                            EdgeInsets.only(left: responsiveWidth(context, 8)),
                        child: Text(
                          '\$${food.originalPrice.toStringAsFixed(2)}',
                        ),
                      ),
                  ],
                ),
                SizedBox(height: responsiveHeight(context, 12)),
                Text(
                  food.description,
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
                              ),
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
                                  Text(
                                    context.l10n.mild,
                                  ),
                                  Text(
                                    context.l10n.hot,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: responsiveWidth(context, 16)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              context.l10n.quantity,
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
                                      horizontal: responsiveWidth(context, 12)),
                                  child: Text(
                                    '${state.quantity}',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                                QuantityButton(
                                  color: Theme.of(context).colorScheme.primary,
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
                SizedBox(height: responsiveHeight(context, 100)),
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
