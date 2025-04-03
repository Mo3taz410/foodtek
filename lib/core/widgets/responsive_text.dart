import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final double? minFontSize;
  final double? maxFontSize;
  final TextOverflow? overflow;

  const ResponsiveText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.minFontSize = 10,
    this.maxFontSize,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    final baseSize = style?.fontSize ?? 14.sp;

    return AutoSizeText(
      text,
      style:
          style?.copyWith(fontSize: baseSize) ?? TextStyle(fontSize: baseSize),
      textAlign: textAlign,
      maxLines: maxLines,
      minFontSize: minFontSize!,
      maxFontSize: maxFontSize ?? baseSize,
      overflow: overflow,
      stepGranularity: 1,
    );
  }
}
