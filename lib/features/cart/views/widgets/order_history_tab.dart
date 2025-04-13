import 'package:flutter/material.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/constants/app_colors.dart';
import 'package:foodtek/core/constants/app_animation_strings.dart';
import 'package:foodtek/core/dummy_data/food_dummy_data.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:lottie/lottie.dart';

class OrderHistoryTab extends StatelessWidget {
  final List<String> orderHistoryIds = ['b2', 'p1', 'b3']; // just example IDs

  OrderHistoryTab({super.key});

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
                style: const TextStyle(color: AppColors.secondary),
              ),
            ),
          );
        }

        final food = orderHistory[index];
        final String date = "25.3.2024"; // for now hardcoded

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border:
                Border.all(color: AppColors.secondary.withValues(alpha: .2)),
          ),
          child: Row(
            children: [
              Image.asset(food.image, width: 60, height: 60, fit: BoxFit.cover),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(food.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text('\$${food.currentPrice.toStringAsFixed(2)}',
                        style: const TextStyle(color: AppColors.tertiary)),
                  ],
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.access_time,
                          size: 16, color: AppColors.tertiary),
                      const SizedBox(width: 4),
                      Text(date, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // TODO: implement reorder logic
                    },
                    child: Text(
                      context.l10n.reorder,
                      style: const TextStyle(
                          color: AppColors.tertiary,
                          fontWeight: FontWeight.bold),
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
            Lottie.asset(AppAnimationStrings.emptyHistory),
            SizedBox(height: responsiveHeight(context, 24)),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: responsiveHeight(context, 12)),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
