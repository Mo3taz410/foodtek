import 'package:flutter/material.dart';
import 'package:foodtek/core/helpers/shared_preferences_helper.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/app_image_strings.dart';
import 'package:foodtek/core/utils/app_strings.dart';
import 'package:foodtek/core/utils/app_text_styles.dart';
import 'package:foodtek/features/auth/views/screens/login_screen.dart';
import 'package:foodtek/features/onboarding/screen/onboarding_screen.dart';

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

    // Wait 3 seconds first
    await Future.delayed(const Duration(seconds: 3));

    // Then get the value
    bool isFirstTime = await prefs.getPrefBool(
      key: 'isFirstTime',
      defaultValue: true,
    );

    if (!mounted) return; // Check if widget is still in the tree

    // Then navigate
    if (isFirstTime) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const OnboardingScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
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
              style: AppTextStyles.logo(context),
            ),
          ),
        ],
      ),
    );
  }
}
