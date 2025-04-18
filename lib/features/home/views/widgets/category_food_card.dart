import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
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
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        AppCustomButton(
                          text: context.l10n.yes,
                          textStyle: Theme.of(context).textTheme.labelMedium,
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
                border: Border.all(),
              ),
              child: Column(
                spacing: responsiveHeight(context, 15),
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: responsiveHeight(context, 10)),
                  Text(
                    food.name,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    food.description,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '\$${food.currentPrice.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            Positioned(
              top: responsiveHeight(context, -50),
              left: 0,
              right: responsiveWidth(context, 15),
              child: Container(
                width: responsiveWidth(context, 100),
                height: responsiveHeight(context, 100),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: responsiveWidth(context, 75),
                    height: responsiveHeight(context, 75),
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset(
                      food.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: responsiveHeight(context, -10),
              right: responsiveWidth(context, 10),
              child: Container(
                width: responsiveWidth(context, 30),
                height: responsiveHeight(context, 30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => _handleFavoriteTap(context, isFavorite),
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.black,
                    size: 25,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: responsiveHeight(context, 100),
              left: 0,
              right: 0,
              child: Center(
                child: AppCustomButton(
                  text: context.l10n.order_now,
                  onPressed: () {
                    Navigator.pushNamed(context, '/food_details',
                        arguments: food);
                  },
                  height: responsiveHeight(context, 40),
                  width: responsiveWidth(context, 100),
                  borderRadius: 30,
                  textStyle: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
