import 'package:flutter/material.dart';
import 'package:foodtek/core/constants/app_colors.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/core/utils/responsive.dart';

class RecommendedFoodCard extends StatelessWidget {
  final FoodModel food;

  const RecommendedFoodCard({super.key, required this.food});

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.asset(
              food.image,
              width: responsiveWidth(context, 80),
              height: responsiveHeight(context, 108),
              fit: BoxFit.contain,
            ),
            Positioned(
              bottom: 4,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '\$${food.discountedPrice?.toStringAsFixed(2) ?? food.originalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 8,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
