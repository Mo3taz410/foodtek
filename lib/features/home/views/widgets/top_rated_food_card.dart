import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/theme/app_colors/app_light_colors.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/cart/controllers/cart_cubit.dart';

class TopRatedFoodCard extends StatelessWidget {
  final FoodModel food;

  const TopRatedFoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/food_details',
          arguments: food,
        );
      },
      child: Container(
        width: responsiveWidth(context, 155),
        padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(context, 12),
          vertical: responsiveHeight(context, 8),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppLightColors.quinary, width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.star, color: AppLightColors.septenary, size: 16),
                Text(food.rating.toString(), style: AppTextStyles.appSubTitle),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: responsiveHeight(context, 3),
              children: [
                Image.asset(
                  food.image,
                  height: responsiveHeight(context, 70),
                  width: responsiveWidth(context, 80),
                ),
                Text(
                  food.name,
                  style: AppTextStyles.topRatedFoodName,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  food.description,
                  style: AppTextStyles.appSubTitle,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${food.currentPrice.toStringAsFixed(2)}',
                      style: AppTextStyles.appSubTitle,
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().addToCart(food);
                      },
                      icon: Icon(Icons.add_circle,
                          color: AppLightColors.secondary),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
