import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/responsive.dart';

class AppCustomImage extends StatelessWidget {
  final String imagePath;
  final String tagText;

  const AppCustomImage({
    super.key,
    required this.imagePath,
    required this.tagText,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            width: responsiveWidth(context, 72),
            height: responsiveHeight(context, 108),
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 4,
            right: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                tagText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
