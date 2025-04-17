import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/constants/app_image_strings.dart';
import 'package:foodtek/core/localization/localization_cubit.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';

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
                  style: Theme.of(context).textTheme.titleLarge,
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
                    Text('Ahmad Daboor',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text(
                      'ahmad1709@gmail.com',
                      style: Theme.of(context).textTheme.bodySmall,
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
                    AppIconStrings.language,
                    context.l10n.language,
                    trailing: Text(
                      Localizations.localeOf(context).languageCode == 'ar'
                          ? 'العربية'
                          : 'English',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onTap: () => _showLanguagePicker(context),
                  ),
                  _buildTile(
                    context,
                    AppIconStrings.privacyPolicy,
                    context.l10n.privacy_policy,
                  ),
                  _buildTile(
                    context,
                    AppIconStrings.profile,
                    context.l10n.settings,
                  ),
                ],
              ),
              _buildCard(
                context,
                title: context.l10n.push_notifications,
                children: [
                  _buildSwitchTile(
                    context,
                    Icons.notifications,
                    context.l10n.push_notifications,
                    true,
                  ),
                  _buildSwitchTile(
                    context,
                    Icons.notifications_none,
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
                    context,
                    AppIconStrings.logOut,
                    context.l10n.log_out,
                    iconColor: Colors.red,
                    titleColor: Colors.red,
                    onTap: () => Navigator.pushNamed(context, '/login'),
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
    return Container(
      margin: EdgeInsets.only(bottom: responsiveHeight(context, 16)),
      padding: EdgeInsets.all(responsiveWidth(context, 16)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(responsiveWidth(context, 16)),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.bold)),
          ...children,
        ],
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
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: titleColor,
              ),
        ),
        trailing: trailing,
        onTap: onTap ?? () {},
      ),
    );
  }

  Widget _buildSwitchTile(
      BuildContext context, IconData icon, String title, bool value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, size: responsiveHeight(context, 22)),
      title: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      trailing: Switch(value: value, onChanged: (v) {}),
    );
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
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
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
