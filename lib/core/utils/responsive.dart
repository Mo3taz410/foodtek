import 'package:flutter/widgets.dart';

/// Function to calculate responsive height based on screen dimensions.
/// It adjusts the given height proportionally to the screen size.
///
/// [value] : The target height you want.
/// [baseHeight] : The base height of the screen you're designing on (e.g., 932).
///
/// Returns a double value for the responsive height.
double responsiveHeight(BuildContext context, double value,
    {double baseHeight = 932}) {
  double screenHeight = MediaQuery.of(context).size.height;
  return (value / baseHeight) * screenHeight;
}

/// Function to calculate responsive width based on screen dimensions.
/// It adjusts the given width proportionally to the screen size.
///
/// [value] : The target width you want.
/// [baseWidth] : The base width of the screen you're designing on (e.g., 430).
///
/// Returns a double value for the responsive width.
double responsiveWidth(BuildContext context, double value,
    {double baseWidth = 430}) {
  double screenWidth = MediaQuery.of(context).size.width;
  return (value / baseWidth) * screenWidth;
}

/// Function to calculate responsive text size based on screen width.
/// It ensures text scales proportionally across different screen sizes.
///
/// [fontSize] : The target font size you want.
/// [baseWidth] : The base width of the screen you're designing on (e.g., 430).
///
/// Returns a double value for the responsive font size.
double responsiveTextSize(BuildContext context, double fontSize,
    {double baseWidth = 430, double baseHeight = 932}) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  /// Calculate scaling factors for width and height
  double widthFactor = screenWidth / baseWidth;
  double heightFactor = screenHeight / baseHeight;

  /// Average both factors to balance text scaling
  double scaleFactor = (widthFactor + heightFactor) / 2;

  return fontSize * scaleFactor;
}
