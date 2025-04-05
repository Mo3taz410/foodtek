import 'package:flutter/material.dart';
import 'package:foodtek/core/utils/app_image_strings.dart';
import 'package:foodtek/features/home/views/widgets/recommended__item.dart';

class RecommendList extends StatelessWidget {
  const RecommendList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        RecommendedItem(imagePath: AppImageStrings.sushi, tagText: '\$103.0'),
        RecommendedItem(
            imagePath: AppImageStrings.chickenAndRice, tagText: '\$50.0'),
        RecommendedItem(imagePath: AppImageStrings.lazania, tagText: '\$12.99'),
        RecommendedItem(imagePath: AppImageStrings.cupcake, tagText: '\$8.20'),
      ],
    );
  }
}
