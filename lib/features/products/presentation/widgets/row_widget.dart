import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class RowWidget extends ConsumerWidget {
  final String text;
  final String btnText;
  final void Function()? onPressed;
  const RowWidget(
      {super.key,
      required this.text,
      required this.btnText,
      required this.onPressed});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: theme.typography.h700.copyWith(fontWeight: FontWeight.w600)),
        InkWell(
          onTap: onPressed,
          child: Text(btnText,
              style: theme.typography.h700.copyWith(
                  fontWeight: FontWeight.w600, color: theme.colors.primary)),
        )
      ],
    );
  }
}
