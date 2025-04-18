import 'package:flutter/material.dart';
import 'package:foodtek/core/utils/responsive.dart';

class AppCustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? errorText;
  final FocusNode? focusNode;
  final String? label;

  const AppCustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.errorText,
    this.focusNode,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: responsiveHeight(context, 4),
            left: responsiveWidth(context, 4),
          ),
          child: Text(
            label ?? '',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        SizedBox(
          width: responsiveWidth(context, 295),
          height: responsiveHeight(context, 45),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            focusNode: focusNode,
            textAlignVertical: TextAlignVertical.center,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle ?? Theme.of(context).textTheme.bodySmall,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              errorText: errorText,
              filled: true,
              contentPadding: EdgeInsets.only(
                left: responsiveWidth(context, 14),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .outline
                      .withValues(alpha: .3),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context)
                      .colorScheme
                      .outline
                      .withValues(alpha: .3),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
