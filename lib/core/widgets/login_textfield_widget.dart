import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class TextfieldWidget extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget prefixIcon;
  const TextfieldWidget(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: typography.h400.copyWith(color: colors.textSubtlest),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: colors.textSubtlest, width: 1)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(color: colors.textSubtlest, width: 1),
          ),
        ),
      ),
    );
  }
}
