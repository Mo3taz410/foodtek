import 'package:flutter/material.dart';
import 'package:foodtek/core/helpers/shared_preferences_helper.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_image_strings.dart';
import '../../core/constants/app_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    final prefs = SharedPreferencesHelper();
    await Future.delayed(const Duration(seconds: 3));
    bool isFirstTime = await prefs.getPrefBool(
      key: 'isFirstTime',
      defaultValue: true,
    );

    if (!mounted) return;
    if (isFirstTime) {
      Navigator.pushReplacementNamed(context, '/onboarding');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImageStrings.backgroundPattern,
              fit: BoxFit.cover,
              color: AppColors.primary,
              colorBlendMode: BlendMode.dstATop,
            ),
          ),
          Center(
            child: Text(
              AppStrings.logo,
              style: AppTextStyles.logo,
            ),
          ),
        ],
      ),
    );
  }
}
