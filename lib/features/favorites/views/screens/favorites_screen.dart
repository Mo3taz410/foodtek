import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/favorites/controllers/favorites_cubit.dart';
import 'package:foodtek/features/home/views/widgets/food_card.dart';
import 'package:foodtek/features/favorites/models/all_dummy_items.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(responsiveWidth(context, 16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.l10n.favorites,
                  style: AppTextStyles.topRated.copyWith(fontSize: 20)),
              SizedBox(
                height: responsiveHeight(context, 80),
              ),
              BlocBuilder<FavoritesCubit, Set<String>>(
                builder: (context, favoriteIds) {
                  final favorites = allDummyItems
                      .where((item) => favoriteIds.contains(item['id']))
                      .toList();

                  if (favorites.isEmpty) {
                    return const Center(child: Text("No favorites yet."));
                  }

                  return Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: favorites.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: responsiveHeight(context, 320),
                        mainAxisSpacing: responsiveHeight(context, 20),
                        crossAxisSpacing: responsiveWidth(context, 16),
                      ),
                      itemBuilder: (context, index) {
                        final item = favorites[index];
                        return FoodCard(
                          imagePath: item['imagePath'],
                          title: item['title'],
                          description: item['description'],
                          price: item['price'],
                          isFavorite: true,
                          onOrder: () {},
                          onFavoriteTap: () {
                            context
                                .read<FavoritesCubit>()
                                .toggleFavorite(item['id']);
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
