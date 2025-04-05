import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_image_strings.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/home/controllers/category_nav_cubit.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/features/home/models/food_category.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = FoodCategory.values;

    final Map<FoodCategory, String> labels = {
      FoodCategory.all: context.l10n.all,
      FoodCategory.burger: context.l10n.burger,
      FoodCategory.pizza: context.l10n.pizza,
      FoodCategory.sandwich: context.l10n.sandwich,
    };

    final Map<FoodCategory, String> images = {
      FoodCategory.all: '',
      FoodCategory.burger: AppImageStrings.burger,
      FoodCategory.pizza: AppImageStrings.pizza,
      FoodCategory.sandwich: AppImageStrings.sandwich,
    };

    return SizedBox(
      height: responsiveHeight(context, 50),
      child: BlocBuilder<CategoryNavCubit, FoodCategory>(
        builder: (context, selectedIndex) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = selectedIndex == FoodCategory.values[index];

              return GestureDetector(
                onTap: () {
                  context
                      .read<CategoryNavCubit>()
                      .updateCategory(FoodCategory.values[index]);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveHeight(context, 14),
                    vertical: responsiveHeight(context, 8),
                  ),
                  margin: EdgeInsets.only(right: responsiveWidth(context, 12)),
                  decoration: BoxDecoration(
                    color:
                        isSelected ? AppColors.secondary : Colors.transparent,
                    border: Border.all(color: AppColors.quinary),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (images[category]!.isNotEmpty)
                        Image.asset(
                          images[category]!,
                          width: responsiveWidth(context, 20),
                          height: responsiveHeight(context, 20),
                        ),
                      if (images[category]!.isNotEmpty)
                        SizedBox(width: responsiveWidth(context, 6)),
                      Text(
                        labels[category]!,
                        style: AppTextStyles.tabBarItemTitle.copyWith(
                          color:
                              isSelected ? Colors.white : AppColors.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
