import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class LoginTextfieldWidget extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  const LoginTextfieldWidget({
    super.key,
    required this.hintText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final spacer = AppTheme.of(context).spaces;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: spacer.space_300),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: typography.h400.copyWith(color: colors.textSubtlest),
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
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
