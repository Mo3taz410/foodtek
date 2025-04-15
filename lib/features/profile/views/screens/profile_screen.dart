import 'package:flutter/material.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
import '../../../../core/constants/app_image_strings.dart';

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
                  style: TextStyle(
                    fontSize: responsiveHeight(context, 24),
                    fontWeight: FontWeight.bold,
                  ),
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
                      'Ahmad Daboor',
                      style: TextStyle(
                        fontSize: responsiveHeight(context, 18),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'ahmad1709@gmail.com',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: responsiveHeight(context, 14),
                      ),
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
                    onTap: () {
                      Navigator.pushNamed(context, '/edit_profile');
                    },
                  ),
                  _buildTile(
                    context,
                    AppIconStrings.language,
                    context.l10n.language,
                    trailing: Text(
                      'English',
                      style: TextStyle(
                        fontSize: responsiveHeight(context, 14),
                      ),
                    ),
                  ),
                  _buildTile(
                    context,
                    AppIconStrings.privacyPolicy,
                    context.l10n.privacy_policy,
                  ),
                  _buildTile(
                      context, AppIconStrings.profile, context.l10n.settings),
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
                    textColor: Colors.red,
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
        color: Colors.white,
        borderRadius: BorderRadius.circular(responsiveWidth(context, 16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: responsiveHeight(context, 16),
            ),
          ),
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
    Color? textColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: AppSvgIcons(
        iconPath: iconPath,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor ?? Colors.black,
          fontSize: responsiveHeight(context, 16),
        ),
      ),
      trailing: trailing,
      onTap: onTap ?? () {},
    );
  }

  Widget _buildSwitchTile(
      BuildContext context, IconData icon, String title, bool value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, size: responsiveHeight(context, 22)),
      title: Text(
        title,
        style: TextStyle(fontSize: responsiveHeight(context, 16)),
      ),
      trailing: Switch(value: value, onChanged: (v) {}),
    );
  }
}
