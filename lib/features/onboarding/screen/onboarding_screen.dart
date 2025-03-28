import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodtek/core/utils/app_animation_strings.dart';
import 'package:foodtek/core/utils/app_colors.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/core/utils/shared_preferences_helper.dart';
import 'package:foodtek/features/onboarding/widgets/onboarding_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/utils/app_image_strings.dart';
import '../../../l10n/app_localizations.dart';
import '../../auth/views/screens/login_screen.dart';

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
    double topOffset = responsiveHeight(context, 300) * 0.3; // 30% from top

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
                  colors: [
                    AppColors.tertiary,
                    AppColors.quinary,
                  ],
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
                        title: AppLocalizations.of(context)!.welcome_title,
                        subtitle:
                            AppLocalizations.of(context)!.welcome_subtitle,
                        onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                      ),
                      OnboardingWidget(
                        animationPath: AppAnimationStrings.deliveryDriving,
                        title: AppLocalizations.of(context)!.choose_food,
                        subtitle:
                            AppLocalizations.of(context)!.delivery_description,
                        onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                      ),
                      OnboardingWidget(
                        animationPath: AppAnimationStrings.deliveryOnTime,
                        title: AppLocalizations.of(context)!.delivery_on_time,
                        subtitle:
                            AppLocalizations.of(context)!.delivery_description,
                        onPressed: () => pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                      ),
                      OnboardingWidget(
                        animationPath: AppAnimationStrings.locationPermission,
                        title: AppLocalizations.of(context)!.turn_on_location,
                        subtitle:
                            AppLocalizations.of(context)!.location_description,
                        isLast: true,
                        onPressed: () async {
                          final prefs = SharedPreferencesHelper();
                          await prefs.setPrefBool(
                              key: 'isFirstTime', value: false);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
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
                          child: Text(AppLocalizations.of(context)!.skip),
                        ),
                        SmoothPageIndicator(
                            controller: pageController,
                            count: 3,
                            effect: WormEffect(dotColor: AppColors.quinary),
                            onDotClicked: (index) =>
                                pageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                )),
                        IconButton(
                          onPressed: currentIndex == 2
                              ? null
                              : () => pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn,
                                  ),
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: AppColors.primary,
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
