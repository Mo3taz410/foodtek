import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_icon_strings.dart';
import 'package:foodtek/features/app/controllers/bottom_nav_cubit.dart';
import '../../../../core/widgets/app_svg_icons.dart';
import 'cart_screen.dart';
import 'favorites_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'track_screen.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  static final List<Widget> screens = [
    const HomeScreen(),
    const FavoritesScreen(),
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
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.quinary,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.tertiary,
            currentIndex: selectedIndex,
            onTap: (value) => context.read<BottomNavCubit>().updateIndex(value),
            items: [
              BottomNavigationBarItem(
                icon: AppSvgIcons(iconPath: AppIconStrings.home),
                label: context.l10n.home,
              ),
              BottomNavigationBarItem(
                icon: AppSvgIcons(iconPath: AppIconStrings.favorites),
                label: context.l10n.favorites,
              ),
              BottomNavigationBarItem(
                icon: AppSvgIcons(iconPath: AppIconStrings.cart),
                label: context.l10n.cart,
              ),
              BottomNavigationBarItem(
                icon: AppSvgIcons(iconPath: AppIconStrings.track),
                label: context.l10n.track,
              ),
              BottomNavigationBarItem(
                icon: AppSvgIcons(iconPath: AppIconStrings.profile),
                label: context.l10n.profile,
              ),
            ],
          ),
        );
      },
    );
  }
}
