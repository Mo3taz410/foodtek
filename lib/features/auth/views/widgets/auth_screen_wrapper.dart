import 'package:flutter/material.dart';
import 'package:foodtek/core/constants/app_image_strings.dart';
import 'package:foodtek/core/constants/app_strings.dart';
import 'package:foodtek/core/utils/responsive.dart';

class AuthScreenWrapper extends StatelessWidget {
  final Widget child;

  const AuthScreenWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              AppImageStrings.backgroundPattern,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: responsiveHeight(context, 24),
                  ),
                  child: Text(
                    AppStrings.logo,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: responsiveWidth(context, 43.5),
                        ),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: child,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
