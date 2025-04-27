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
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/food_details',
          arguments: food,
        );
      },
      child: Container(
        width: responsiveWidth(context, 155),
        padding: EdgeInsets.all(responsiveWidth(context, 8)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 16,
                  color: Colors.amber,
                ),
                SizedBox(width: responsiveWidth(context, 4)),
                Text(
                  food.rating.toString(),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
            SizedBox(height: responsiveHeight(context, 8)),
            Center(
              child: Image.asset(
                food.image,
                height: responsiveHeight(context, 80),
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: responsiveHeight(context, 8)),
            Text(
              food.name,
              style: Theme.of(context).textTheme.displayMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: responsiveHeight(context, 4)),
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: responsiveHeight(context, 30),
              ),
              child: Text(
                food.description,
                style: Theme.of(context).textTheme.displaySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: responsiveHeight(context, 8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${food.currentPrice.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  onPressed: () {
                    context.read<CartCubit>().addToCart(food);
                  },
                  icon: Icon(
                    Icons.add_circle,
                    size: 24,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
