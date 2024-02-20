import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class HeadingWidget extends ConsumerWidget {
  final String text;

  const HeadingWidget({super.key, required this.text});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: theme.typography.h700.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
