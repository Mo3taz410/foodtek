import 'package:flutter/material.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/core/widgets/app_custom_text_field.dart';

import '../../../../core/constants/app_image_strings.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final addressController = TextEditingController();

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
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: responsiveWidth(context, 40),
                      backgroundImage:
                          AssetImage(AppImageStrings.profilePicture),
                    ),
                    Text(
                      'Waseem Samour',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Text(
                      'waseemsamour@gmail.com',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
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
                ),
                AppCustomButton(
                  text: context.l10n.update,
                  onPressed: () {},
                  height: responsiveHeight(context, 48),
                  width: responsiveWidth(context, 300),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
