import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/features/app/controllers/bottom_nav_cubit.dart';
import 'package:foodtek/features/app/views/widgets/floating_cart_icon.dart';
import '../../../../core/theme/app_colors/app_light_colors.dart';
import '../../../../core/constants/app_icon_strings.dart';
import '../../../../core/widgets/app_svg_icons.dart';
import '../../../cart/controllers/cart_cubit.dart';
import '../../../cart/views/screen/cart_screen.dart';
import '../../../favorites/views/screen/favorites_screen.dart';
import '../../../home/views/screen/home_screen.dart';
import '../../../profile/views/screens/profile_screen.dart';
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
            backgroundColor: AppLightColors.octonary,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedItemColor: AppLightColors.primary,
            unselectedItemColor: AppLightColors.tertiary,
            currentIndex: selectedIndex,
            onTap: (index) {
              if (index != 2) {
                context.read<BottomNavCubit>().updateIndex(index);
              }
            },
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
                icon: const SizedBox.shrink(), // Center icon is FAB now
                label: '',
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
