import 'package:flutter/material.dart';
import 'package:foodtek/core/helpers/shared_preferences_helper.dart';
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
    await Future.delayed(const Duration(seconds: 3));
    bool isFirstTime = await SharedPreferencesHelper().getPrefBool(
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
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImageStrings.backgroundPattern,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Text(
              AppStrings.logo,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ],
      ),
    );
  }
}
