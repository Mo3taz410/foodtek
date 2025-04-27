import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/features/app/controllers/bottom_nav_cubit.dart';
import 'package:foodtek/features/app/views/widgets/floating_cart_icon.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
import 'package:foodtek/features/cart/controllers/cart_cubit.dart';
import 'package:foodtek/features/cart/views/screen/cart_screen.dart';
import 'package:foodtek/features/favorites/views/screen/favorites_screen.dart';
import 'package:foodtek/features/home/views/screen/home_screen.dart';
import 'package:foodtek/features/profile/views/screens/profile_screen.dart';
import 'track_screen.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  static final List<Widget> screens = [
    HomeScreen(),
    FavoritesScreen(),
    const CartScreen(),
    const TrackScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          body: screens[selectedIndex],
          floatingActionButton: FloatingCartIcon(
            isSelected: selectedIndex == 2,
            onTap: () {
              context.read<BottomNavCubit>().updateIndex(2);
            },
            itemCount: context.watch<CartCubit>().state.length,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              if (index != 2) {
                context.read<BottomNavCubit>().updateIndex(index);
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: AppSvgIcons(
                  iconPath: AppIconStrings.home,
                  color: selectedIndex == 0
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
                label: context.l10n.home,
              ),
              BottomNavigationBarItem(
                icon: AppSvgIcons(
                  iconPath: AppIconStrings.favorites,
                  color: selectedIndex == 1
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
                label: context.l10n.favorites,
              ),
              const BottomNavigationBarItem(
                icon: SizedBox.shrink(),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: AppSvgIcons(
                  iconPath: AppIconStrings.track,
                  color: selectedIndex == 3
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
                label: context.l10n.track,
              ),
              BottomNavigationBarItem(
                icon: AppSvgIcons(
                  iconPath: AppIconStrings.profile,
                  color: selectedIndex == 4
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
                label: context.l10n.profile,
              ),
            ],
          ),
        );
      },
    );
  }
}
