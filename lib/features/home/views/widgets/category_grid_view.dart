import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/dummy_data/food_dummy_data.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/features/home/controllers/category_nav_cubit.dart';
import 'package:foodtek/features/home/views/widgets/category_food_card.dart';
import 'package:foodtek/core/utils/responsive.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryNavCubit, FoodCategory>(
      builder: (context, selectedCategory) {
        final List<FoodModel> filteredFoods = selectedCategory ==
                FoodCategory.all
            ? dummyFoods
            : dummyFoods.where((f) => f.category == selectedCategory).toList();

        if (filteredFoods.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: responsiveHeight(context, 40),
              ),
              child: Text(
                context.l10n.no_food_founds_in_this_category,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.only(top: responsiveHeight(context, 20)),
          itemCount: filteredFoods.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: responsiveHeight(context, 275),
            crossAxisSpacing: responsiveWidth(context, 16),
          ),
          itemBuilder: (context, index) {
            final food = filteredFoods[index];
            return CategoryFoodCard(food: food);
          },
        );
      },
    );
  }
}
