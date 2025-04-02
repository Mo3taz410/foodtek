import 'package:flutter/material.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_header.dart';
import 'package:foodtek/core/widgets/app_search_bar.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';

import '../../../../top_rated_food_list.dart';

final List<Map<String, String>> categories = [
  {'image': '', 'label': 'All'},
  {'image': 'assets/icons/food/burger.png', 'label': 'Burger'},
  {'image': 'assets/icons/food/pizza.png', 'label': 'Pizza'},
  {'image': 'assets/icons/food/sandwich.png', 'label': 'Sandwich'},
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppCustomHeader(),
              const SizedBox(height: 10),
              AppSearchBar(controller: searchController),
              const SizedBox(height: 10),
              _buildCategoryList(context),
              const SizedBox(height: 20),
              _buildPromoBanner(context),
              const SizedBox(height: 20),
              _buildSectionTitle(context, 'Top Rated'),
              _buildTopRatedList(context),
              const SizedBox(height: 20),
              _buildSectionTitle(context, 'Recommend', showViewAll: true),
              _buildRecommendList(context),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() => selectedIndex = index);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.secondary : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.secondary.withOpacity(0.4)),
              ),
              child: Row(
                children: [
                  if (categories[index]['image']!.isNotEmpty)
                    Image.asset(
                      categories[index]['image']!,
                      width: responsiveWidth(context, 24),
                      height: responsiveHeight(context, 24),
                    ),
                  if (categories[index]['image']!.isNotEmpty)
                    const SizedBox(width: 6),
                  Text(
                    categories[index]['label']!,
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppColors.secondary,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPromoBanner(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Image.asset(
        'assets/images/Frame.png',
        width: responsiveWidth(context, 370),
        height: responsiveHeight(context, 137),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title,
      {bool showViewAll = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: showViewAll
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.authTitle(context),
          ),
          if (showViewAll)
            Text(
              'View All',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: responsiveTextSize(context, 14),
                color: AppColors.tertiary,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTopRatedList(BuildContext context) {
    final topRatedList = TopRatedFoodList();

    return SizedBox(
      height: responsiveHeight(context, 248),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topRatedList.topRatedFoodL.length,
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 17)),
        itemBuilder: (context, index) {
          final food = topRatedList.topRatedFoodL[index];
          return Container(
            width: responsiveWidth(context, 155),
            height: responsiveHeight(context, 209),
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.septenary,
                      size: responsiveTextSize(context, 16),
                    ),
                    Text(
                      food.rating.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(food.imagePath,
                        height: responsiveHeight(context, 70),
                        width: responsiveWidth(context, 87),
                        fit: BoxFit.cover),
                    const SizedBox(height: 6),
                    Text(food.name,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    Text(
                      food.description,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${food.price.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondary)),
                        Icon(Icons.add_circle, color: AppColors.secondary),
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

  Widget _buildRecommendList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 17)),
      child: SizedBox(
          height: responsiveHeight(context, 157),
          child: Row(
            children: [
              SizedBox(
                width: responsiveWidth(context, 72),
                height: responsiveHeight(context, 108),
                child: Image.asset(
                  'assets/images/shusi.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )),
    );
  }
}
