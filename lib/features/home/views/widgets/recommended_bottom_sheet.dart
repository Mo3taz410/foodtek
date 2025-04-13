import 'package:flutter/material.dart';
import 'package:foodtek/core/dummy_data/food_dummy_data.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'recommended_food_card.dart';

class RecommendedBottomSheet extends StatelessWidget {
  const RecommendedBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FoodModel> recommended = dummyFoods
        .where((f) => f.isRecommended)
        .toList()
      ..sort((a, b) => b.orderedCount.compareTo(a.orderedCount));
    final top10 = recommended.take(10).toList();

    return Container(
      height: responsiveHeight(context, 240),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, 20),
        vertical: responsiveHeight(context, 16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Top Recommendations",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              )),
          const SizedBox(height: 12),
          SizedBox(
            height: responsiveHeight(context, 150),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: top10.length,
              separatorBuilder: (_, __) =>
                  SizedBox(width: responsiveWidth(context, 12)),
              itemBuilder: (context, index) {
                return RecommendedFoodCard(food: top10[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
