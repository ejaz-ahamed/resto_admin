import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class TextFieldCouponWidget extends StatelessWidget {
  const TextFieldCouponWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return TextField(
      controller: TextEditingController(),
      decoration: InputDecoration(
        hintText: 'enter value here...',
        hintStyle: TextStyle(color: theme.colors.textDisabled),
      ),
    );
  }
}
