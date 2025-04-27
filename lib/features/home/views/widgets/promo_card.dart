import 'package:flutter/material.dart';
import 'package:foodtek/core/constants/app_image_strings.dart';
import 'package:foodtek/core/utils/responsive.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(
            flex: 1, // keep them equal
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 16),
                vertical: responsiveHeight(context, 16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    // 👈 this fixes the overflow
                    child: Text(
                      'Experience our\ndelicious new dish',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FittedBox(
                    // 👈 auto-shrink "30% OFF" if needed
                    child: Text(
                      '30% OFF',
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1, // keep them equal
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: Image.asset(
                AppImageStrings.promo,
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
