import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_icons.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/features/auth/controllers/auth_cubit.dart';
import 'package:foodtek/features/auth/models/user_model.dart';
import 'package:foodtek/l10n/app_localizations.dart';
import '../widgets/auth_screen_wrapper.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_bottom_text_row.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final focusNodes = {
    'fullName': FocusNode(),
    'email': FocusNode(),
    'phone': FocusNode(),
    'password': FocusNode(),
    'confirm': FocusNode(),
  };

  final errors = <String, String?>{
    'fullName': null,
    'email': null,
    'phone': null,
    'password': null,
    'confirm': null,
    'birthDate': null,
  };

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    for (final node in focusNodes.values) {
      node.dispose();
    }
    super.dispose();
  }

  void _validateAndSubmit(BuildContext context, AuthState state) {
    final loc = AppLocalizations.of(context)!;
    final birthDate = state is AuthInitial ? state.selectedBirthDate : null;

    final user = UserModel(
      fullName: fullNameController.text,
      email: emailController.text,
      password: passwordController.text,
      phoneNumber: phoneController.text,
      birthDate: birthDate,
    );

    final confirmMatch =
        passwordController.text == confirmPasswordController.text;

    setState(() {
      errors['fullName'] = user.isValidFullName ? null : loc.error_invalid_name;
      errors['email'] = user.isValidEmail ? null : loc.error_invalid_email;
      errors['phone'] =
          user.isValidPhoneNumber ? null : loc.error_invalid_phone;
      errors['password'] =
          user.isValidPassword ? null : loc.error_invalid_password;
      errors['confirm'] = confirmMatch ? null : loc.error_passwords_mismatch;
      errors['birthDate'] =
          user.isValidBirthDate ? null : loc.error_invalid_birth_date;
    });

    final firstInvalid = errors.entries.firstWhere(
      (e) => e.value != null,
      orElse: () => const MapEntry('', null),
    );

    if (firstInvalid.key.isNotEmpty) {
      if (focusNodes[firstInvalid.key] case final node?) {
        FocusScope.of(context).requestFocus(node);
      } else {
        FocusScope.of(context).unfocus();
      }
      return;
    }

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
              icon: AppIcons.icon(context, AppIcons.arrowLeftLong),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Text(AppLocalizations.of(context)!.sign_up,
              style: AppTextStyles.authTitle(context)),
          AuthBottomTextRow(
            label: AppLocalizations.of(context)!.already_have_account,
            actionText: AppLocalizations.of(context)!.login,
            onPressed: () => Navigator.pop(context),
          ),
          AuthTextField(
            controller: fullNameController,
            hintText: AppLocalizations.of(context)!.full_name,
            hintStyle: AppTextStyles.authTextFieldsHintStyle(context),
            prefixIcon: AppIcons.icon(context, AppIcons.user),
            errorText: errors['fullName'],
            focusNode: focusNodes['fullName'],
          ),
          AuthTextField(
            controller: emailController,
            hintText: AppLocalizations.of(context)!.email,
            hintStyle: AppTextStyles.authTextFieldsHintStyle(context),
            prefixIcon: AppIcons.icon(context, AppIcons.email),
            keyboardType: TextInputType.emailAddress,
            errorText: errors['email'],
            focusNode: focusNodes['email'],
          ),
          GestureDetector(
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate:
                    DateTime.now().subtract(const Duration(days: 365 * 18)),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                context.read<AuthCubit>().updateBirthDate(picked);
              }
            },
            child: AbsorbPointer(
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  final birthDate =
                      state is AuthInitial ? state.selectedBirthDate : null;
                  return AuthTextField(
                    controller: TextEditingController(
                      text: birthDate != null
                          ? "${birthDate.toLocal()}".split(" ")[0]
                          : '',
                    ),
                    hintText: AppLocalizations.of(context)!.birth_date,
                    hintStyle: AppTextStyles.authTextFieldsHintStyle(context),
                    prefixIcon: AppIcons.icon(context, AppIcons.calendar),
                    errorText: errors['birthDate'],
                  );
                },
              ),
            ),
          ),
          AuthTextField(
            controller: phoneController,
            hintText: AppLocalizations.of(context)!.phone_number,
            hintStyle: AppTextStyles.authTextFieldsHintStyle(context),
            prefixIcon: AppIcons.icon(context, AppIcons.phone),
            keyboardType: TextInputType.phone,
            errorText: errors['phone'],
            focusNode: focusNodes['phone'],
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final isHidden = state is AuthInitial && state.isPasswordHidden;
              return AuthTextField(
                controller: passwordController,
                hintText: AppLocalizations.of(context)!.set_password,
                hintStyle: AppTextStyles.authTextFieldsHintStyle(context),
                obscureText: isHidden,
                prefixIcon: AppIcons.icon(context, AppIcons.password),
                suffixIcon: IconButton(
                  icon: AppIcons.icon(
                      context, isHidden ? AppIcons.eye : AppIcons.eyeSlash),
                  onPressed: () =>
                      context.read<AuthCubit>().togglePasswordVisibility(),
                ),
                errorText: errors['password'],
                focusNode: focusNodes['password'],
              );
            },
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final isHidden =
                  state is AuthInitial && state.isConfirmPasswordHidden;
              return AuthTextField(
                controller: confirmPasswordController,
                hintText: AppLocalizations.of(context)!.confirm_new_password,
                hintStyle: AppTextStyles.authTextFieldsHintStyle(context),
                obscureText: isHidden,
                prefixIcon: AppIcons.icon(context, AppIcons.password),
                suffixIcon: IconButton(
                  icon: AppIcons.icon(
                      context, isHidden ? AppIcons.eye : AppIcons.eyeSlash),
                  onPressed: () => context
                      .read<AuthCubit>()
                      .toggleConfirmPasswordVisibility(),
                ),
                errorText: errors['confirm'],
                focusNode: focusNodes['confirm'],
              );
            },
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage)),
                );
              }
            },
            builder: (context, state) {
              return AppCustomButton(
                text: state is AuthLoading
                    ? "Loading..."
                    : AppLocalizations.of(context)!.register,
                width: double.infinity,
                height: responsiveHeight(context, 48),
                color: AppColors.primary,
                textStyle: AppTextStyles.authButton(context),
                onPressed: () => _validateAndSubmit(context, state),
              );
            },
          ),
        ],
      ),
    );
  }
}
