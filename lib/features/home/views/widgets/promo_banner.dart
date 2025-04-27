import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/home/controllers/promo_nav_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'promo_card.dart'; // import the new PromoCard

class PromoBanner extends StatelessWidget {
  final PageController controller;
  const PromoBanner({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    const int promoCount = 5;

    return Column(
      spacing: responsiveHeight(context, 5),
      children: [
        SizedBox(
          height: responsiveHeight(context, 140),
          width: responsiveWidth(context, 370),
          child: PageView.builder(
            controller: controller,
            itemCount: promoCount,
            itemBuilder: (context, index) {
              return const PromoCard();
            },
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: promoCount,
          effect: SlideEffect(
            dotHeight: responsiveHeight(context, 4),
            dotWidth: responsiveWidth(context, 20),
            spacing: responsiveWidth(context, 4),
            dotColor: Theme.of(context).colorScheme.secondary,
            activeDotColor: Theme.of(context).colorScheme.primary,
          ),
          onDotClicked: (index) {
            context.read<PromoNavCubit>().updateIndex(index);
            controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
            );
          },
        ),
      ],
    );
  }
}
