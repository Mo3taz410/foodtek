import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/app/views/widgets/app_custom_header.dart';
import 'package:foodtek/features/app/views/widgets/app_search_bar.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
import 'package:foodtek/features/home/controllers/category_nav_cubit.dart';
import 'package:foodtek/features/home/views/widgets/category_grid_view.dart';
import 'package:foodtek/features/home/views/widgets/category_selector.dart';
import 'package:foodtek/features/home/views/widgets/promo_banner.dart';
import 'package:foodtek/features/home/views/widgets/recommend_list.dart';
import 'package:foodtek/features/home/views/widgets/top_rated_list.dart';
import '../../../../core/constants/app_icon_strings.dart';
import '../../../../core/models/food_model.dart';
import '../widgets/recommended_bottom_sheet.dart';

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context, 30),
            vertical: responsiveHeight(context, 30),
          ),
          child: Column(
            spacing: responsiveHeight(context, 20),
            children: [
              AppCustomHeader(),
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
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (_) => const RecommendedBottomSheet(),
                        );
                      },
                      child: Row(
                        spacing: responsiveWidth(context, 10),
                        children: [
                          Text(
                            context.l10n.view_all,
                            style:
                                AppTextStyles.topRated.copyWith(fontSize: 12),
                          ),
                          AppSvgIcons(
                            iconPath: AppIconStrings.rightArrow,
                            width: responsiveWidth(context, 12),
                            height: responsiveHeight(context, 12),
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
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: responsiveHeight(context, 50),
          ),
          CategoryGridView(),
        ],
      ),
    );
  }
}
