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
  final bool? readOnly;

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
    this.label,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: EdgeInsets.only(
              bottom: responsiveHeight(context, 4),
              left: responsiveWidth(context, 4),
            ),
            child: Text(
              label ?? '',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        SizedBox(
          width: double.infinity,
          height: responsiveHeight(context, 45),
          child: TextField(
            readOnly: readOnly ?? false,
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            focusNode: focusNode,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle ?? Theme.of(context).textTheme.labelMedium,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              errorText: errorText,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 14),
                vertical: responsiveHeight(context, -20),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  width: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
