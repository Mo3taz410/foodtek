import 'package:flutter/material.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/home/views/widgets/food_card.dart';

class CategoryGridView extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  const CategoryGridView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: responsiveHeight(context, 320),
        mainAxisSpacing: responsiveHeight(context, 20),
        crossAxisSpacing: responsiveWidth(context, 16),
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return FoodCard(
          imagePath: item['imagePath'],
          title: item['title'],
          description: item['description'],
          price: item['price'],
          onOrder: () {},
          isFavorite: item['isFavorite'] ?? false,
        );
      },
    );
  }
}
