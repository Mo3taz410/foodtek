import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/models/food_model.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
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
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black.withValues(alpha: .6),
                  ),
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
                      children: [
                        Text(
                          context.l10n.remove_from_favorites,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(height: responsiveHeight(context, 30)),
                        AppCustomButton(
                          text: context.l10n.yes,
                          width: double.infinity,
                          height: responsiveHeight(context, 48),
                          onPressed: () {
                            cubit.toggleFavorite(food.id);
                            Navigator.pop(context);
                          },
                        ),
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
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              child: Column(
                spacing: responsiveHeight(context, 15),
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: responsiveHeight(context, 10)),
                  Text(
                    food.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: responsiveWidth(context, 10),
                        height: responsiveHeight(context, 45),
                        alignment: Alignment.topCenter,
                        child: AppSvgIcons(
                          iconPath: AppIconStrings.thunder,
                          width: responsiveWidth(context, 8),
                          height: responsiveHeight(context, 10),
                          color: Colors.amber,
                        ),
                      ),
                      SizedBox(width: responsiveWidth(context, 4)),
                      Expanded(
                        child: Text(
                          food.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
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
                    width: responsiveWidth(context, 90),
                    height: responsiveHeight(context, 90),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      food.image,
                      fit: BoxFit.contain,
                      width: responsiveWidth(context, 75),
                      height: responsiveHeight(context, 75),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: responsiveHeight(context, -20),
              right: responsiveWidth(context, 0),
              child: InkWell(
                onTap: () => _handleFavoriteTap(context, isFavorite),
                child: Container(
                  width: responsiveWidth(context, 35),
                  height: responsiveHeight(context, 35),
                  padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(context, 10),
                    vertical: responsiveHeight(context, 10),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: AppSvgIcons(
                    iconPath: isFavorite
                        ? AppIconStrings.favoritesFilled
                        : AppIconStrings.favorites,
                    color: isFavorite
                        ? Colors.red
                        : Theme.of(context)
                            .colorScheme
                            .onSecondary, // keep in mind
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: responsiveHeight(context, 60),
              left: 0,
              right: 0,
              child: Center(
                child: AppCustomButton(
                  text: context.l10n.order_now,
                  textStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/food_details',
                        arguments: food);
                  },
                  height: responsiveHeight(context, 30),
                  width: responsiveWidth(context, 100),
                  borderRadius: 30,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
