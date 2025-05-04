import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
import 'package:foodtek/features/auth/controllers/auth_cubit.dart';
import 'package:foodtek/features/auth/models/user_model.dart';
import '../../../../core/constants/app_icon_strings.dart';
import '../../../../core/widgets/app_custom_text_field.dart';
import '../widgets/auth_screen_wrapper.dart';
import '../widgets/auth_bottom_text_row.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final birthDateController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    birthDateController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateAndSubmit(BuildContext context) {
    final state = context.read<AuthCubit>().state;
    final birthDate = state is AuthInitial ? state.selectedBirthDate : null;

    final user = UserModel(
      fullName: fullNameController.text,
      email: emailController.text,
      password: passwordController.text,
      phoneNumber: phoneController.text,
      birthDate: birthDate,
    );

    context.read<AuthCubit>().signUp(user);
  }

  @override
  Widget build(BuildContext context) {
    return AuthScreenWrapper(
      child: Column(
        spacing: responsiveHeight(context, 15),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: AppSvgIcons(
                iconPath: AppIconStrings.leftLongArrow,
                width: responsiveWidth(context, 12),
                height: responsiveHeight(context, 12),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Text(
            context.l10n.sign_up,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          AuthBottomTextRow(
            label: context.l10n.already_have_account,
            actionText: context.l10n.login,
            onPressed: () => Navigator.pop(context),
          ),
          AppCustomTextField(
            controller: fullNameController,
            hintText: context.l10n.full_name,
            label: context.l10n.full_name,
          ),
          AppCustomTextField(
            controller: emailController,
            hintText: context.l10n.email,
            keyboardType: TextInputType.emailAddress,
            label: context.l10n.email,
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              // final birthDate =
              //     state is AuthInitial ? state.selectedBirthDate : null;
              return AppCustomTextField(
                controller: birthDateController,
                hintText: context.l10n.birth_date,
                label: context.l10n.birth_date,
                readOnly: true,
                suffixIcon: IconButton(
                  icon: AppSvgIcons(
                    iconPath: AppIconStrings.calendar,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now()
                          .subtract(const Duration(days: 365 * 18)),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            textTheme: Theme.of(context).textTheme.copyWith(
                                  headlineLarge: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (picked != null) {
                      if (!context.mounted) return;
                      context.read<AuthCubit>().updateBirthDate(picked);
                      birthDateController.text =
                          "${picked.toLocal()}".split(" ")[0];
                    }
                  },
                ),
              );
            },
          ),
          AppCustomTextField(
            controller: phoneController,
            hintText: context.l10n.phone_number,
            keyboardType: TextInputType.phone,
            label: context.l10n.phone_number,
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final isHidden = state is AuthInitial && state.isPasswordHidden;
              return AppCustomTextField(
                controller: passwordController,
                hintText: context.l10n.set_password,
                obscureText: isHidden,
                suffixIcon: IconButton(
                  icon: isHidden
                      ? AppSvgIcons(
                          iconPath: AppIconStrings.eyeOff,
                          color: Theme.of(context).colorScheme.primary)
                      : AppSvgIcons(
                          iconPath: AppIconStrings.eye,
                          color: Theme.of(context).colorScheme.primary),
                  onPressed: () =>
                      context.read<AuthCubit>().togglePasswordVisibility(),
                ),
                label: context.l10n.set_password,
              );
            },
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final isHidden =
                  state is AuthInitial && state.isConfirmPasswordHidden;
              return AppCustomTextField(
                controller: confirmPasswordController,
                hintText: context.l10n.confirm_new_password,
                obscureText: isHidden,
                suffixIcon: IconButton(
                  icon: isHidden
                      ? AppSvgIcons(
                          iconPath: AppIconStrings.eyeOff,
                          color: Theme.of(context).colorScheme.primary)
                      : AppSvgIcons(
                          iconPath: AppIconStrings.eye,
                          color: Theme.of(context).colorScheme.primary),
                  onPressed: () => context
                      .read<AuthCubit>()
                      .toggleConfirmPasswordVisibility(),
                ),
                label: context.l10n.confirm_new_password,
              );
            },
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text(state.errorMessage)),
                // );
              }
            },
            builder: (context, state) {
              return AppCustomButton(
                text:
                    state is AuthLoading ? "Loading..." : context.l10n.register,
                width: double.infinity,
                height: responsiveHeight(context, 48),
                onPressed: () => _validateAndSubmit(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
