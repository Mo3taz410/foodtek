import 'package:flutter/material.dart';

class SliderThumbWithBorder extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(24, 16);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final RRect outerRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: 16, height: 20),
      const Radius.circular(8),
    );

    final RRect innerRect = RRect.fromRectAndRadius(
      Rect.fromCenter(center: center, width: 10, height: 14),
      const Radius.circular(5),
    );

    final Paint borderPaint = Paint()..color = Colors.white;
    final Paint fillPaint = Paint()..color = Color(0xFFEF2A39);

    canvas.drawRRect(outerRect, borderPaint);
    canvas.drawRRect(innerRect, fillPaint);
  }
}
