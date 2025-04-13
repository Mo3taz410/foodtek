import 'package:flutter/material.dart';
import 'package:foodtek/core/dummy_data/food_dummy_data.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'recommended_food_card.dart';

class RecommendList extends StatelessWidget {
  const RecommendList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FoodModel> recommendedFoods =
        dummyFoods.where((f) => f.isRecommended).take(4).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: recommendedFoods.map((food) {
        return RecommendedFoodCard(food: food);
      }).toList(),
    );
  }
}
