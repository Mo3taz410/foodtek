import 'package:flutter/material.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/features/home/models/top_rated_food_list.dart';

class TopRatedList extends StatelessWidget {
  const TopRatedList({super.key});

  @override
  Widget build(BuildContext context) {
    final topRatedList = TopRatedFoodList();
    return SizedBox(
      height: responsiveHeight(context, 200),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: topRatedList.topRatedFoodL.length,
        separatorBuilder: (_, __) =>
            SizedBox(width: responsiveWidth(context, 12)),
        itemBuilder: (context, index) {
          final food = topRatedList.topRatedFoodL[index];
          return Container(
            width: responsiveWidth(context, 155),
            padding:
                EdgeInsets.symmetric(horizontal: responsiveWidth(context, 12)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.quinary, width: 1.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: AppColors.septenary, size: 16),
                    Text(food.rating.toString(),
                        style: AppTextStyles.authSubTitle),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      food.imagePath,
                      height: responsiveHeight(context, 70),
                      width: responsiveWidth(context, 80),
                    ),
                    Text(food.name,
                        style: AppTextStyles.topRatedFoodName,
                        overflow: TextOverflow.ellipsis),
                    Text(food.description,
                        style: AppTextStyles.authSubTitle,
                        overflow: TextOverflow.ellipsis),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${food.price.toStringAsFixed(2)}',
                            style: AppTextStyles.authSubTitle),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add_circle,
                              color: AppColors.secondary),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
