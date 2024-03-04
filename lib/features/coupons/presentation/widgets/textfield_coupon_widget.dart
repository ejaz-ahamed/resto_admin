import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class TextFieldCouponWidget extends StatelessWidget {
  final TextEditingController? controller;
  const TextFieldCouponWidget({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: theme.spaces.space_100,
            horizontal: theme.spaces.space_200),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colors.textSubtle, width: .2),
        ),
        hintText: 'enter value here...',
        hintStyle: TextStyle(color: theme.colors.textDisabled),
      ),
    );
  }
}
