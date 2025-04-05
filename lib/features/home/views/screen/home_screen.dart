import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_icon_strings.dart';
import 'package:foodtek/core/utils/app_image_strings.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_header.dart';
import 'package:foodtek/core/widgets/app_search_bar.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
import 'package:foodtek/features/home/controllers/category_nav_cubit.dart';
import 'package:foodtek/features/home/models/food_category.dart';
import 'package:foodtek/features/home/views/widgets/category_grid_view.dart';
import 'package:foodtek/features/home/views/widgets/category_selector.dart';
import 'package:foodtek/features/home/views/widgets/promo_banner.dart';
import 'package:foodtek/features/home/views/widgets/recommend_list.dart';
import 'package:foodtek/features/home/views/widgets/top_rated_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  final PageController promoController = PageController();
  String currentPlaceName = "Set your location";

  Future<void> _goToLocationPicker(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/locationPicker');
    if (result is Map && result['placeName'] != null) {
      setState(() {
        currentPlaceName = result['placeName'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsiveWidth(context, 30)),
        child: Column(
          spacing: responsiveHeight(context, 20),
          children: [
            AppCustomHeader(
              placeName: currentPlaceName,
              onTap: () => _goToLocationPicker(context),
            ),
            AppSearchBar(controller: searchController),
            const CategorySelector(),
            Expanded(
              child: BlocBuilder<CategoryNavCubit, FoodCategory>(
                builder: (context, category) {
                  return _buildTabContent(context, category);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(BuildContext context, FoodCategory category) {
    if (category == FoodCategory.all) {
      return SingleChildScrollView(
        child: Column(
          spacing: responsiveHeight(context, 20),
          children: [
            PromoBanner(controller: promoController),
            Column(
              spacing: responsiveHeight(context, 10),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.l10n.top_rated, style: AppTextStyles.topRated),
                const TopRatedList(),
              ],
            ),
            Column(
              spacing: responsiveHeight(context, 10),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(context.l10n.recommend, style: AppTextStyles.topRated),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            context.l10n.view_all,
                            style:
                                AppTextStyles.topRated.copyWith(fontSize: 12),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: AppSvgIcons(
                              iconPath: AppIconStrings.rightArrow,
                              width: responsiveWidth(context, 12),
                              height: responsiveHeight(context, 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const RecommendList(),
              ],
            ),
          ],
        ),
      );
    }

    final data = _getCategoryData(category);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: responsiveHeight(context, 100)),
          CategoryGridView(items: data),
          SizedBox(height: responsiveHeight(context, 50)),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getCategoryData(FoodCategory category) {
    List<String> images;
    List<String> titles;
    List<String> descriptions;
    List<double> prices;

    switch (category) {
      case FoodCategory.burger:
        images = [
          AppImageStrings.chickenBurger,
          AppImageStrings.cheeseBurger,
          AppImageStrings.chickenBurger,
          AppImageStrings.cheeseBurger,
        ];
        titles = [
          'Classic Burger',
          'Cheese Delight',
          'Spicy Chicken',
          'Veggie Burger'
        ];
        descriptions = [
          '100% Beef patty',
          'Loaded with cheese',
          'Hot and spicy',
          'Fresh veggies'
        ];
        prices = [5.0, 6.0, 5.5, 4.5];
        break;
      case FoodCategory.pizza:
        images = [
          AppImageStrings.pepperoniPizza,
          AppImageStrings.cheesePizza,
          AppImageStrings.peppyPaneerPizza,
          AppImageStrings.mexicanGreenWavePizza,
        ];
        titles = [
          'Pepperoni Pizza',
          'Cheese Pizza',
          'Peppy Paneer',
          'Mexican Green Wave'
        ];
        descriptions = [
          'With spicy pepperoni',
          'Cheesy goodness',
          'Loaded with veggies',
          'Sweet BBQ sauce'
        ];
        prices = [10.0, 8.0, 9.0, 11.0];
        break;
      case FoodCategory.sandwich:
        images = [
          AppImageStrings.sandwich,
          AppImageStrings.sandwich,
          AppImageStrings.sandwich,
          AppImageStrings.sandwich,
        ];
        titles = [
          'Ham & Cheese',
          'Chicken Sandwich',
          'Veggie Sandwich',
          'Egg Sandwich'
        ];
        descriptions = [
          'Classic favorite',
          'Grilled chicken',
          'Fresh vegetables',
          'Boiled eggs'
        ];
        prices = [3.5, 4.5, 3.0, 2.5];
        break;
      default:
        return [];
    }

    return List.generate(images.length, (index) {
      return {
        'id': '${category.name}_$index',
        'imagePath': images[index],
        'title': titles[index],
        'description': descriptions[index],
        'price': prices[index],
      };
    });
  }
}
