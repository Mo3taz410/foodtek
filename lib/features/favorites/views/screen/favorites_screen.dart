import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/app/views/widgets/app_custom_header.dart';
import 'package:foodtek/features/app/views/widgets/app_search_bar.dart';
import 'package:foodtek/features/favorites/controllers/favorites_cubit.dart';
import 'package:foodtek/core/dummy_data/food_dummy_data.dart';
import 'package:foodtek/features/home/views/widgets/category_food_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(context, 30),
          vertical: responsiveHeight(context, 30),
        ),
        child: Column(
          spacing: responsiveHeight(context, 20),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppCustomHeader(),
            AppSearchBar(controller: TextEditingController()),
            Text(
              context.l10n.favorites, // topRated
            ),
            SizedBox(height: responsiveHeight(context, 40)),
            BlocBuilder<FavoritesCubit, Set<String>>(
              builder: (context, favoriteIds) {
                final List<FoodModel> favorites = dummyFoods
                    .where((food) => favoriteIds.contains(food.id))
                    .toList();

                if (favorites.isEmpty) {
                  return Center(
                    child: Text(
                      context.l10n.no_favorites_yet, // appSubTitle
                    ),
                  );
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: favorites.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: responsiveHeight(context, 320),
                    mainAxisSpacing: responsiveHeight(context, 40),
                    crossAxisSpacing: responsiveWidth(context, 16),
                  ),
                  itemBuilder: (context, index) {
                    return CategoryFoodCard(food: favorites[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
