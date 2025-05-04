import 'package:flutter/material.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/constants/app_animation_strings.dart';
import 'package:foodtek/core/dummy_data/food_dummy_data.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:lottie/lottie.dart';

class HistoryTab extends StatelessWidget {
  final List<String> orderHistoryIds = ['b2', 'p1', 'b3']; // Example IDs

  HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FoodModel> orderHistory =
        dummyFoods.where((food) => orderHistoryIds.contains(food.id)).toList();

    if (orderHistory.isEmpty) {
      return _buildEmptyState(
        context,
        title: context.l10n.history_empty,
        subtitle: context.l10n.history_empty_message,
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: orderHistory.length + 1,
      itemBuilder: (context, index) {
        if (index == orderHistory.length) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                context.l10n.load_more,
              ),
            ),
          );
        }

        final food = orderHistory[index];
        const String date = "25.3.2024"; // Hardcoded for now

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(),
          ),
          child: Row(
            children: [
              Image.asset(food.image, width: 60, height: 60, fit: BoxFit.cover),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '\$${food.currentPrice.toStringAsFixed(2)}',
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        date,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // TODO: implement reorder logic
                    },
                    child: Text(
                      context.l10n.reorder,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context,
      {required String title, required String subtitle}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppAnimationStrings.emptyHistory, repeat: false),
            SizedBox(height: responsiveHeight(context, 24)),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: responsiveHeight(context, 12)),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
