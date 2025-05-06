import 'package:flutter/material.dart';
import 'package:foodtek/core/dummy_data/food_dummy_data.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'top_rated_food_card.dart';

class TopRatedList extends StatelessWidget {
  const TopRatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FoodModel> top10Rated = dummyFoods
        .where((f) => f.isTopRated)
        .toList()
      ..sort((a, b) => b.rating.compareTo(a.rating));

    final List<FoodModel> top10 = top10Rated.take(10).toList();

    return SizedBox(
      height: responsiveHeight(context, 255),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: top10.length,
        separatorBuilder: (_, __) =>
            SizedBox(width: responsiveWidth(context, 12)),
        itemBuilder: (context, index) {
          final food = top10[index];
          return TopRatedFoodCard(food: food);
        },
      ),
    );
  }
}
