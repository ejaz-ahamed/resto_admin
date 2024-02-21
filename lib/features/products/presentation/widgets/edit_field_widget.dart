import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class EditFieldWidget extends ConsumerWidget {
  final String hintText;
  final bool isPrice;
  final TextEditingController controller;
  final bool? enabled;
  final bool? cursor;
  final void Function(String)? onChanged;
  final TextStyle? style;
  const EditFieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isPrice = false,
      this.enabled,
      this.onChanged,
      required this.style,
      this.cursor});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    return TextField(
      showCursor: cursor,
      
      controller: controller,
      onChanged: onChanged,
      enabled: enabled,
      style: apptheme.typography.h500.copyWith(),
      textAlign: isPrice ? TextAlign.right : TextAlign.left,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.all(0),
        hintText: hintText,
        hintStyle: style,
        hintTextDirection: TextDirection.rtl,
        border: InputBorder.none,
      ),
    );
  }
}
