import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/home/controllers/promo_nav_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constants/app_image_strings.dart';

class PromoBanner extends StatelessWidget {
  final PageController controller;
  const PromoBanner({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final List<String> promoImages = List.filled(5, AppImageStrings.promo);

    return Column(
      spacing: responsiveHeight(context, 5),
      children: [
        SizedBox(
          height: responsiveHeight(context, 140),
          width: responsiveWidth(context, 370),
          child: PageView.builder(
            controller: controller,
            itemCount: promoImages.length,
            itemBuilder: (context, index) {
              return Image.asset(
                promoImages[index],
                fit: BoxFit.fill,
              );
            },
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: promoImages.length,
          effect: SlideEffect(
            dotHeight: responsiveHeight(context, 4),
            dotWidth: responsiveWidth(context, 20),
            spacing: responsiveWidth(context, 4),
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
