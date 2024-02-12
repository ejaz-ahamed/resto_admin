import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class EditFieldWidget extends ConsumerWidget {
  final String hintText;
  final bool isPrice;
  final TextEditingController controller;
  final bool enabled;
  const EditFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPrice = false,
    this.enabled = false,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    return TextField(
      controller: controller,
      enabled: enabled,
      style: apptheme.typography.h500
          .copyWith(color: apptheme.colors.textSubtlest),
      textDirection: isPrice ? TextDirection.rtl : TextDirection.ltr,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        hintText: hintText,
        hintStyle: apptheme.typography.h400
            .copyWith(color: apptheme.colors.textSubtle),
        border: InputBorder.none,
      ),
    );
  }
}
