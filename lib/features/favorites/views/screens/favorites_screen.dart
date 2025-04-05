import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_header.dart';
import 'package:foodtek/core/widgets/app_search_bar.dart';
import 'package:foodtek/features/favorites/controllers/favorites_cubit.dart';
import 'package:foodtek/features/home/views/widgets/food_card.dart';
import 'package:foodtek/features/favorites/models/all_dummy_items.dart';

class FavoritesScreen extends StatefulWidget {
  FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final TextEditingController searchController = TextEditingController();

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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              EdgeInsets.symmetric(horizontal: responsiveWidth(context, 30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: responsiveHeight(context, 20)),
              AppCustomHeader(
                placeName: currentPlaceName,
                onTap: () => _goToLocationPicker(context),
              ),
              AppSearchBar(controller: searchController),
              SizedBox(height: responsiveHeight(context, 20)),
              Text(
                context.l10n.favorites,
                style: AppTextStyles.topRated.copyWith(fontSize: 20),
              ),
              SizedBox(height: responsiveHeight(context, 80)),
              BlocBuilder<FavoritesCubit, Set<String>>(
                builder: (context, favoriteIds) {
                  final favorites = allDummyItems
                      .where((item) => favoriteIds.contains(item['id']))
                      .toList();

                  if (favorites.isEmpty) {
                    return const Center(child: Text("No favorites yet."));
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: favorites.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: responsiveHeight(context, 320),
                      mainAxisSpacing: responsiveHeight(context, 20),
                      crossAxisSpacing: responsiveWidth(context, 16),
                    ),
                    itemBuilder: (context, index) {
                      final item = favorites[index];
                      return FoodCard(
                        imagePath: item['imagePath'],
                        title: item['title'],
                        description: item['description'],
                        price: item['price'],
                        isFavorite: true,
                        onOrder: () {},
                        onFavoriteTap: () {
                          context
                              .read<FavoritesCubit>()
                              .toggleFavorite(item['id']);
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(height: responsiveHeight(context, 40)),
            ],
          ),
        ),
      ),
    );
  }
}
