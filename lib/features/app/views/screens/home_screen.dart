import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_icon_strings.dart';
import 'package:foodtek/core/utils/app_image_strings.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_header.dart';
import 'package:foodtek/features/app/controllers/promo_nav_cubit.dart';
import 'package:foodtek/features/app/views/widgets/recommended__item.dart';
import 'package:foodtek/core/widgets/app_search_bar.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/top_rated_food_list.dart';

final List<Map<String, String>> categories = [
  {'image': '', 'label': 'All'},
  {'image': AppImageStrings.burger, 'label': 'Burger'},
  {'image': AppImageStrings.pizza, 'label': 'Pizza'},
  {'image': AppImageStrings.sandwich, 'label': 'Sandwich'},
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final PageController promoController = PageController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: SafeArea(
        child: Column(
          children: [
            AppCustomHeader(),
            AppSearchBar(controller: searchController),
            _buildTabBar(context),
            Expanded(
              child: TabBarView(
                children: categories.map((category) {
                  return _buildTabContent(context, category['label']!);
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return TabBar(
      isScrollable: true,
      indicator: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(16),
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Colors.white,
      unselectedLabelColor: AppColors.secondary,
      labelPadding: const EdgeInsets.symmetric(horizontal: 12),
      tabs: categories.map((category) {
        final hasImage = category['image']!.isNotEmpty;
        return Tab(
          child: Row(
            children: [
              if (hasImage)
                Image.asset(
                  category['image']!,
                  width: 24,
                  height: 24,
                ),
              if (hasImage) const SizedBox(width: 6),
              Text(
                category['label']!,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTabContent(BuildContext context, String label) {
    if (label == 'All') {
      return SingleChildScrollView(
        child: Column(
          children: [
            _buildPromoBanner(context),
            _buildSectionTitle(context, context.l10n.top_rated),
            _buildTopRatedList(context),
            _buildSectionTitle(context, context.l10n.recommend,
                showViewAll: true),
            _buildRecommendList(context),
          ],
        ),
      );
    } else {
      return Center(child: Text('Display $label items here'));
    }
  }

  Widget _buildPromoBanner(BuildContext context) {
    final List<String> promoImages = [
      AppImageStrings.promo,
      AppImageStrings.pizza,
      AppImageStrings.burger,
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: responsiveHeight(context, 137),
            child: PageView.builder(
              controller: promoController,
              itemCount: promoImages.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  promoImages[index],
                  width: responsiveWidth(context, 370),
                  height: responsiveHeight(context, 137),
                  fit: BoxFit.fill,
                );
              },
            ),
          ),
          SmoothPageIndicator(
            controller: promoController,
            count: promoImages.length,
            effect: WormEffect(dotColor: AppColors.quinary),
            onDotClicked: (index) {
              context.read<PromoNavCubit>().updateIndex(index);
              promoController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            },
          ),
        ],
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
          Text(title, style: AppTextStyles.authTitle),
          if (showViewAll)
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    context.l10n.view_all,
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 12.sp,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: AppSvgIcons(
                      iconPath: AppIconStrings.rightArrow,
                      width: responsiveWidth(context, 8),
                      height: responsiveHeight(context, 13),
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }

  Widget _buildTopRatedList(BuildContext context) {
    final topRatedList = TopRatedFoodList();
    return SizedBox(
      height: responsiveHeight(context, 300),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: topRatedList.topRatedFoodL.length,
        separatorBuilder: (context, index) => SizedBox(
          width: responsiveWidth(context, 12),
        ),
        itemBuilder: (context, index) {
          final food = topRatedList.topRatedFoodL[index];
          return Container(
            width: responsiveWidth(context, 155),
            height: responsiveHeight(context, 210),
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 12),
              vertical: responsiveHeight(context, 8),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.septenary,
                      size: 16.sp,
                    ),
                    Text(
                      food.rating.toString(),
                      style: AppTextStyles.authSubTitle,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      food.imagePath,
                      height: responsiveHeight(context, 70),
                      width: responsiveWidth(context, 87),
                      fit: BoxFit.cover,
                    ),
                    Text(
                      food.name,
                      style: AppTextStyles.topRatedFoodName,
                    ),
                    Text(
                      food.description,
                      style: AppTextStyles.authSubTitle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${food.price.toStringAsFixed(2)}',
                          style: AppTextStyles.authSubTitle,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle,
                            color: AppColors.secondary,
                          ),
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

  Widget _buildRecommendList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 17)),
      child: SizedBox(
        height: responsiveHeight(context, 157),
        child: Row(
          children: [
            RecommendedItem(
                imagePath: AppImageStrings.sushi, tagText: '\$103.0'),
            RecommendedItem(
                imagePath: AppImageStrings.chickenAndRice, tagText: '\$50.0'),
            RecommendedItem(
                imagePath: AppImageStrings.lazania, tagText: '\$12.99'),
            RecommendedItem(
                imagePath: AppImageStrings.cupcake, tagText: '\$8.20'),
          ],
        ),
      ),
    );
  }
}
