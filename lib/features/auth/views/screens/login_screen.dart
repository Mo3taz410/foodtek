import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/constants/app_icon_strings.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/widgets/app_svg_icons.dart';
import 'package:foodtek/features/auth/controllers/auth_cubit.dart';
import 'package:foodtek/features/auth/controllers/remember_me_cubit.dart';
import 'package:foodtek/features/auth/models/user_model.dart';
import 'package:foodtek/core/widgets/app_custom_button.dart';
import '../widgets/auth_screen_wrapper.dart';
import '../../../../core/widgets/app_custom_text_field.dart';
import '../widgets/social_auth_buttons.dart';
import '../widgets/auth_bottom_text_row.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return AuthScreenWrapper(
      child: Column(
        spacing: responsiveHeight(context, 15),
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            context.l10n.login,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          AuthBottomTextRow(
            label: context.l10n.dont_have_account,
            actionText: context.l10n.sign_up,
            onPressed: () {
              Navigator.pushNamed(context, '/signup');
            },
          ),
          AppCustomTextField(
            controller: emailController,
            hintText: context.l10n.email,
            keyboardType: TextInputType.emailAddress,
            label: context.l10n.email,
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              final isHidden = state is AuthInitial && state.isPasswordHidden;
              return AppCustomTextField(
                controller: passwordController,
                hintText: context.l10n.password,
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
                label: context.l10n.password,
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
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (_) {
                            context.read<RememberMeCubit>().toggle();
                          },
                        ),
                        Text(
                          context.l10n.remember_me,
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/reset_password');
                    },
                    child: Text(
                      context.l10n.forgot_password,
                    ),
                  ),
                ],
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
                text: state is AuthLoading
                    ? context.l10n.loading
                    : context.l10n.login,
                width: double.infinity,
                height: responsiveHeight(context, 48),
                onPressed: () {
                  final user = UserModel(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  context.read<AuthCubit>().login(user);
                  Navigator.pushReplacementNamed(context, '/app');
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
