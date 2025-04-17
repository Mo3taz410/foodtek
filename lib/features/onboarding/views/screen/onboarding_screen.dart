import 'package:flutter/material.dart';
import 'package:foodtek/core/localization/localization_extension.dart';
import 'package:foodtek/core/helpers/shared_preferences_helper.dart';
import 'package:foodtek/core/constants/app_animation_strings.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/constants/app_image_strings.dart';
import '../../../../core/helpers/location_helper.dart';
import '../widgets/onboarding_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double topOffset = responsiveHeight(context, 300) * 0.3;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: responsiveHeight(context, 300),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [],
                  stops: [0.0, 0.3],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                AppImageStrings.backgroundPattern,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Main onboarding content
          Positioned(
            top: topOffset,
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: PageView(
                    controller: pageController,
                    physics: currentIndex == 3
                        ? const NeverScrollableScrollPhysics()
                        : const BouncingScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    children: [
                      OnboardingWidget(
                        animationPath:
                            AppAnimationStrings.deliveryWaitingForOrder,
                        title: context.l10n.welcome_title,
                        subtitle: context.l10n.welcome_subtitle,
                        onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                      ),
                      OnboardingWidget(
                        animationPath: AppAnimationStrings.deliveryDriving,
                        title: context.l10n.choose_food,
                        subtitle: context.l10n.delivery_description,
                        onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                      ),
                      OnboardingWidget(
                        animationPath: AppAnimationStrings.deliveryOnTime,
                        title: context.l10n.delivery_on_time,
                        subtitle: context.l10n.delivery_description,
                        onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                      ),
                      OnboardingWidget(
                        animationPath: AppAnimationStrings.locationPermission,
                        title: context.l10n.turn_on_location,
                        subtitle: context.l10n.location_description,
                        isLast: true,
                        onPressed: () async {
                          final prefs = SharedPreferencesHelper();
                          await prefs.setPrefBool(
                              key: 'isFirstTime', value: false);
                          if (!context.mounted) return;

                          final address =
                              await LocationHelper.getCurrentAddress(context);
                          await prefs.setPrefString(
                              key: 'userAddress', value: address ?? '');
                          if (!context.mounted) return;

                          Navigator.pushReplacementNamed(context, '/login');
                        },
                      ),
                    ],
                  ),
                ),

                // Bottom indicators & skip
                if (currentIndex < 3)
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: responsiveHeight(context, 65)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            pageController.animateToPage(
                              3,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(
                            context.l10n.skip,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        SmoothPageIndicator(
                          controller: pageController,
                          count: 3,
                          effect: WormEffect(),
                          onDotClicked: (index) => pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          ),
                        ),
                        IconButton(
                          onPressed: currentIndex == 2
                              ? null
                              : () => pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn,
                                  ),
                          icon: Icon(
                            Icons.arrow_forward,
                          ),
                        ),
                      ],
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
