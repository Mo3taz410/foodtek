import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/favorites/controllers/favorites_cubit.dart';
import 'package:foodtek/features/home/views/widgets/food_card.dart';

class CategoryGridView extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  const CategoryGridView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, Set<String>>(
      builder: (context, favorites) {
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
            final String id = item['id']; // id is now guaranteed

            return FoodCard(
              imagePath: item['imagePath'],
              title: item['title'],
              description: item['description'],
              price: item['price'],
              isFavorite: favorites.contains(id),
              onFavoriteTap: () =>
                  context.read<FavoritesCubit>().toggleFavorite(id),
              onOrder: () {
                // Handle order action
              },
            );
          },
        );
      },
    );
  }
}
