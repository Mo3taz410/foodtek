import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/constants/app_image_strings.dart';
import 'package:foodtek/core/localization/localization_cubit.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
import 'package:foodtek/features/splash/splash_screen.dart';
import '../../../../core/theme/theme_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(responsiveWidth(context, 16)),
          child: Column(
            spacing: responsiveHeight(context, 10),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  context.l10n.profile,
                ),
              ),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: responsiveWidth(context, 40),
                      backgroundImage:
                          AssetImage(AppImageStrings.profilePicture),
                    ),
                    Text(
                      'Waseem Samour',
                    ),
                    Text(
                      'waseemsamour@gmail.com',
                    ),
                  ],
                ),
              ),
              _buildCard(
                context,
                title: context.l10n.my_account,
                children: [
                  _buildTile(
                    context,
                    AppIconStrings.personalInformation,
                    context.l10n.personal_information,
                    onTap: () => Navigator.pushNamed(context, '/edit_profile'),
                  ),
                  _buildTile(
                    context,
                    AppIconStrings.privacyPolicy,
                    context.l10n.privacy_policy,
                  ),
                  _buildTile(
                    context,
                    AppIconStrings.settings,
                    context.l10n.settings,
                  ),
                  _buildTile(
                    context,
                    AppIconStrings.language,
                    context.l10n.language,
                    trailing: Text(
                      Localizations.localeOf(context).languageCode == 'ar'
                          ? 'العربية'
                          : 'English',
                    ),
                    onTap: () => _showLanguagePicker(context),
                  ),
                  _buildSwitchTile(
                    context,
                    Icon(Icons.dark_mode_outlined,
                        size: responsiveHeight(context, 22)),
                    context.l10n.dark_mode,
                    _isDarkMode(context),
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme(value);
                    },
                  ),
                ],
              ),
              _buildCard(
                context,
                title: context.l10n.push_notifications,
                children: [
                  _buildSwitchTile(
                    context,
                    AppSvgIcons(iconPath: AppIconStrings.pushNotifications),
                    context.l10n.push_notifications,
                    true,
                  ),
                  _buildSwitchTile(
                    context,
                    AppSvgIcons(iconPath: AppIconStrings.pushNotifications),
                    context.l10n.promotional_notifications,
                    false,
                  ),
                ],
              ),
              _buildCard(
                context,
                title: context.l10n.more,
                children: [
                  _buildTile(
                    context,
                    AppIconStrings.helpCenter,
                    context.l10n.help_center,
                  ),
                  _buildTile(
                    context, AppIconStrings.logOut, context.l10n.log_out,
                    iconColor: Colors.red,
                    titleColor: Colors.red,
                    // onTap: () => Navigator.pushNamed(context, '/login'),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SplashScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required String title, required List<Widget> children}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
            ),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildTile(
    BuildContext context,
    String iconPath,
    String title, {
    Widget? trailing,
    Color? iconColor,
    Color? titleColor,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: AppSvgIcons(
          iconPath: iconPath,
          color: iconColor,
        ),
        title: Text(
          title,
        ),
        trailing: trailing,
        onTap: onTap ?? () {},
      ),
    );
  }

  Widget _buildSwitchTile(
    BuildContext context,
    Widget icon,
    String title,
    bool value, {
    void Function(bool)? onChanged,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: icon,
      title: Text(
        title,
      ),
      trailing: Switch(value: value, onChanged: onChanged),
    );
  }

  bool _isDarkMode(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;

    if (themeMode == ThemeMode.system) {
      final brightness = MediaQuery.of(context).platformBrightness;
      return brightness == Brightness.dark;
    }

    return themeMode == ThemeMode.dark;
  }

  void _showLanguagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(responsiveHeight(context, 16)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.l10n.choose_language,
              ),
              const Divider(),
              ListTile(
                title: const Text('English'),
                onTap: () {
                  context.read<LocalizationCubit>().changeLocale('en');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('العربية'),
                onTap: () {
                  context.read<LocalizationCubit>().changeLocale('ar');
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
