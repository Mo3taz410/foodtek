import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/extensions/localization_extension.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_icon_strings.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
import 'package:foodtek/features/auth/controllers/auth_cubit.dart';
import 'package:foodtek/features/auth/controllers/remember_me_cubit.dart';
import 'package:foodtek/features/auth/models/user_model.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import 'package:foodtek/features/auth/views/screens/reset_password_screen.dart';
import 'package:foodtek/features/auth/views/screens/signup_screen.dart';
import '../widgets/auth_screen_wrapper.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/social_auth_buttons.dart';
import '../widgets/auth_bottom_text_row.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return AuthScreenWrapper(
      child: Column(
        spacing: responsiveHeight(context, 15),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(context.l10n.login, style: AppTextStyles.authTitle(context)),
          AuthBottomTextRow(
            label: context.l10n.dont_have_account,
            actionText: context.l10n.sign_up,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignupScreen(),
                ),
              );
            },
          ),
          AuthTextField(
            controller: emailController,
            hintText: context.l10n.email,
            hintStyle: AppTextStyles.authTextFieldsHintStyle(context),
            keyboardType: TextInputType.emailAddress,
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final isHidden = state is AuthInitial && state.isPasswordHidden;
              return AuthTextField(
                controller: passwordController,
                hintText: context.l10n.password,
                hintStyle: AppTextStyles.authTextFieldsHintStyle(context),
                obscureText: isHidden,
                suffixIcon: IconButton(
                  icon: isHidden
                      ? AppSvgIcons(iconPath: AppIconStrings.eyeOff)
                      : AppSvgIcons(
                          iconPath: AppIconStrings.eyeOff,
                        ),
                  onPressed: () =>
                      context.read<AuthCubit>().togglePasswordVisibility(),
                ),
              );
            },
          ),
          BlocBuilder<RememberMeCubit, bool>(
            builder: (context, isChecked) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<RememberMeCubit>().toggle();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (_) {
                            context.read<RememberMeCubit>().toggle();
                          },
                        ),
                        Text(
                          context.l10n.remember_me,
                          style: AppTextStyles.authSubTitle(context).copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      context.l10n.forgot_password,
                      style: AppTextStyles.authSubTitle(context).copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
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
                text: state is AuthLoading ? "Loading..." : "Log In",
                width: double.infinity,
                height: responsiveHeight(context, 48),
                color: AppColors.primary,
                textStyle: AppTextStyles.authButton(context),
                onPressed: () {
                  final user = UserModel(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  context.read<AuthCubit>().login(user);
                },
              );
            },
          ),
          Row(
            children: [
              const Expanded(child: Divider(thickness: 1)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: responsiveWidth(context, 8)),
                child: Text(
                  context.l10n.or,
                  style: AppTextStyles.authSubTitle(context),
                ),
              ),
              const Expanded(child: Divider(thickness: 1)),
            ],
          ),
          const SocialAuthButtons(),
        ],
      ),
    );
  }
}
