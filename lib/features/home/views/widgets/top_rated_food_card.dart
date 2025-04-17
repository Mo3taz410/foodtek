import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/models/food_model.dart';
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
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                const SizedBox(width: 4),
                Text(food.rating.toString(),
                    style: Theme.of(context).textTheme.labelMedium),
              ],
            ),
            Column(
              spacing: responsiveHeight(context, 3),
              children: [
                Image.asset(
                  food.image,
                  height: responsiveHeight(context, 70),
                  width: responsiveWidth(context, 80),
                ),
                Text(
                  food.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  food.description,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${food.currentPrice.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<CartCubit>().addToCart(food);
                      },
                      icon: Icon(
                        Icons.add_circle,
                      ),
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
