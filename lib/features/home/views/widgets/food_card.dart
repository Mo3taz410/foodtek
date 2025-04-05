import 'package:flutter/material.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';

class FoodCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;
  final VoidCallback onOrder;
  final VoidCallback? onFavoriteTap;
  final bool isFavorite;

  const FoodCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
    required this.onOrder,
    this.isFavorite = false,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: responsiveWidth(context, 175),
          height: responsiveHeight(context, 250),
          padding:
              EdgeInsets.symmetric(vertical: responsiveHeight(context, 10)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppColors.quinary),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTextStyles.foodCardFoodName,
                textAlign: TextAlign.center,
              ),
              Text(
                description,
                style: AppTextStyles.foodCardFoodDescription,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '\$${price.toStringAsFixed(2)}',
                style: AppTextStyles.authSubTitle,
                overflow: TextOverflow.ellipsis,
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fill,
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
            decoration: BoxDecoration(
              color: AppColors.quinary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: onFavoriteTap,
              icon: isFavorite
                  ? Icon(Icons.favorite, color: Colors.red)
                  : Icon(Icons.favorite_border),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Center(
            child: AppCustomButton(
              text: context.l10n.order_now,
              textStyle: AppTextStyles.foodCardButton,
              width: responsiveWidth(context, 95),
              height: responsiveHeight(context, 35),
              onPressed: onOrder,
              color: AppColors.secondary,
              borderRadius: 30,
            ),
          ),
        ),
      ],
    );
  }
}
