import 'package:flutter/material.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/core/widgets/app_custom_text_field.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_image_strings.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final nameController = TextEditingController(text: 'Ahmad Daboor');
  final emailController = TextEditingController(text: 'Loisbecket@gmail.com');
  final phoneController = TextEditingController(text: '0797653948');
  final passwordController = TextEditingController(text: '12345678');
  final addressController =
      TextEditingController(text: '123 Al-Madina Street, Abdali,...');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(responsiveWidth(context, 16)),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: responsiveHeight(context, 16),
              children: [
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      BackButton(onPressed: () => Navigator.pop(context)),
                      Text(
                        context.l10n.profile,
                        style: TextStyle(
                          fontSize: responsiveHeight(context, 24),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: responsiveWidth(context, 40),
                  backgroundImage: AssetImage(AppImageStrings.profilePicture),
                ),
                Text(
                  'Ahmad Daboor',
                  style: TextStyle(
                    fontSize: responsiveHeight(context, 18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'emmie1709@gmail.com',
                  style: TextStyle(
                    fontSize: responsiveHeight(context, 14),
                    color: Colors.grey,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: responsiveHeight(context, 23),
                    horizontal: responsiveWidth(context, 12),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(responsiveWidth(context, 12)),
                  ),
                  child: Column(
                    spacing: responsiveHeight(context, 10),
                    children: [
                      AppCustomTextField(
                        controller: nameController,
                        hintText: context.l10n.full_name,
                        label: context.l10n.full_name,
                      ),
                      AppCustomTextField(
                        hintText: context.l10n.email,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        label: context.l10n.email,
                      ),
                      AppCustomTextField(
                        hintText: context.l10n.phone_number,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        label: context.l10n.phone_number,
                      ),
                      AppCustomTextField(
                        controller: passwordController,
                        hintText: context.l10n.password,
                        label: context.l10n.password,
                      ),
                      AppCustomTextField(
                        hintText: context.l10n.address,
                        controller: addressController,
                        label: context.l10n.address,
                      ),
                    ],
                  ),
                ),
                AppCustomButton(
                  text: context.l10n.update,
                  textStyle: AppTextStyles.appButton,
                  onPressed: () {},
                  height: responsiveHeight(context, 48),
                  width: responsiveWidth(context, 300),
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
