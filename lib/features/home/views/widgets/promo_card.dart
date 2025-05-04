import 'package:flutter/material.dart';
import 'package:foodtek/core/constants/app_image_strings.dart';
import 'package:foodtek/core/utils/responsive.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isRtl ? 0 : 16),
                  bottomLeft: Radius.circular(isRtl ? 0 : 16),
                  topRight: Radius.circular(isRtl ? 16 : 0),
                  bottomRight: Radius.circular(isRtl ? 16 : 0),
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
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isRtl ? 16 : 0),
                bottomLeft: Radius.circular(isRtl ? 16 : 0),
                topRight: Radius.circular(isRtl ? 0 : 16),
                bottomRight: Radius.circular(isRtl ? 0 : 16),
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
