import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class TextFieldWidget extends ConsumerWidget {
  final String textFielTitle;
  final String hintText;
  final TextEditingController controller;
  const TextFieldWidget(
      {super.key,
      required this.textFielTitle,
      required this.hintText,
      required this.controller});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFielTitle,
          style: apptheme.typography.h400,
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              hintText: hintText,
              hintStyle: apptheme.typography.h400
                  .copyWith(color: apptheme.colors.textSubtle),
              border: const OutlineInputBorder(borderSide: BorderSide.none)),
        ),
      ],
    );
  }
}
