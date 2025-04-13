import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/constants/app_colors.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/features/cart/controllers/cart_cubit.dart';
import 'package:foodtek/features/favorites/controllers/favorites_cubit.dart';

class CategoryFoodCard extends StatelessWidget {
  final FoodModel food;

  const CategoryFoodCard({super.key, required this.food});

  void _handleFavoriteTap(BuildContext context, bool isFavorite) {
    final cubit = context.read<FavoritesCubit>();
    if (isFavorite) {
      showDialog(
        context: context,
        barrierColor: Colors.transparent,
        builder: (BuildContext context) {
          return Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withValues(alpha: .6),
                ),
              ),
              Center(
                child: Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: responsiveWidth(context, 24),
                      vertical: responsiveHeight(context, 24),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: responsiveHeight(context, 30),
                      children: [
                        Text(
                          context.l10n.remove_from_favorites,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.appSubTitle,
                        ),
                        AppCustomButton(
                          text: context.l10n.yes,
                          textStyle: AppTextStyles.appButton,
                          color: AppColors.primary,
                          width: double.infinity,
                          height: responsiveHeight(context, 48),
                          onPressed: () {
                            cubit.toggleFavorite(food.id);
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      );
    } else {
      cubit.toggleFavorite(food.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, Set<String>>(
      builder: (context, favorites) {
        final isFavorite = favorites.contains(food.id);

        return Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: responsiveWidth(context, 175),
              height: responsiveHeight(context, 200),
              padding: EdgeInsets.symmetric(
                vertical: responsiveHeight(context, 10),
                horizontal: responsiveWidth(context, 10),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColors.quinary),
              ),
              child: Column(
                spacing: responsiveHeight(context, 15),
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: responsiveHeight(context, 10)),
                  Text(
                    food.name,
                    style: AppTextStyles.foodCardFoodName,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    food.description,
                    style: AppTextStyles.foodCardFoodDescription,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$${food.currentPrice.toStringAsFixed(2)}',
                    style: AppTextStyles.appSubTitle,
                  ),
                ],
              ),
            ),
            Positioned(
              top: -50,
              left: 0,
              right: 15,
              child: Container(
                width: responsiveWidth(context, 100),
                height: responsiveHeight(context, 100),
                decoration: BoxDecoration(
                  color: AppColors.quinary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: responsiveWidth(context, 75),
                    height: responsiveHeight(context, 75),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      food.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: -10,
              right: 10,
              child: Container(
                width: responsiveWidth(context, 25),
                height: responsiveHeight(context, 25),
                decoration: const BoxDecoration(
                  color: AppColors.quinary,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => _handleFavoriteTap(context, isFavorite),
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.black,
                    size: 16,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 0,
              right: 0,
              child: Center(
                child: AppCustomButton(
                  text: context.l10n.order_now,
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/food_details',
                      arguments: food,
                    );
                  },
                  height: responsiveHeight(context, 40),
                  width: responsiveWidth(context, 100),
                  color: AppColors.secondary,
                  borderRadius: 30,
                  textStyle: AppTextStyles.foodCardButton,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
