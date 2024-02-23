import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class TextFieldWidget extends ConsumerWidget {
  final String textFieldTitle;
  final String hintText;
  final TextEditingController controller;
  final int? maxLines;
  final bool enabled;
  final bool expands;

  const TextFieldWidget({
    super.key,
    required this.enabled,
    required this.textFieldTitle,
    required this.hintText,
    required this.controller,
    this.maxLines,
    this.expands = false,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFieldTitle,
          style: apptheme.typography.h600,
        ),
        SizedBox(
          height: AppTheme.of(context).spaces.space_100,
        ),
        TextField(
          enabled: enabled,
          style: apptheme.typography.ui,
          textAlign: TextAlign.justify,
          controller: controller,
          maxLines: maxLines,
          expands: expands,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              hintText: hintText,
              hintStyle: apptheme.typography.h300
                  .copyWith(color: apptheme.colors.textDisabled),
              border: const OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ],
    );
  }
}
