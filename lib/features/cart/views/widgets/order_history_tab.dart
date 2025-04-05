import 'package:flutter/material.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_animation_strings.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_image_strings.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/cart/models/order_history_item.dart';
import 'package:lottie/lottie.dart';

class OrderHistoryTab extends StatelessWidget {
  final List<OrderHistoryItem> orderHistory = [
    OrderHistoryItem(
      name: 'Chicken Burger',
      restaurant: 'Burger Factory LTD',
      price: 20,
      date: '25.3.2024',
      image: AppImageStrings.burgerFactory,
    ),
    OrderHistoryItem(
      name: 'Onion Pizza',
      restaurant: 'Pizza Palace',
      price: 15,
      date: '25.3.2024',
      image: AppImageStrings.onionPizza,
    ),
    OrderHistoryItem(
      name: 'Spicy Shawarma',
      restaurant: 'Hot Cool Spot',
      price: 15,
      date: '25.3.2024',
      image: AppImageStrings.shawarma,
    ),
  ];

  OrderHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
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

        final item = orderHistory[index];
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
              Image.asset(item.image, width: 60, height: 60, fit: BoxFit.cover),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(item.restaurant,
                        style: const TextStyle(color: Colors.grey)),
                    const SizedBox(height: 6),
                    Text('\$${item.price}',
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
                      Text(item.date, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      context.l10n.reorder,
                      style: TextStyle(
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
            Lottie.asset(
              AppAnimationStrings.emptyHistory,
            ),
            SizedBox(
              height: responsiveHeight(context, 24),
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: responsiveHeight(context, 12),
            ),
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
