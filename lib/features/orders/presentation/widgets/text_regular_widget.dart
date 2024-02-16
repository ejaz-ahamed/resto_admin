import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class TextRegularWidget extends ConsumerWidget {
  final String text;
  const TextRegularWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return Text(text,
        style: appTheme.typography.h100.copyWith(
          color: appTheme.colors.text,
        ));
  }
}
