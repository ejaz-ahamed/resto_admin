import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class SelectTimeWidget extends ConsumerWidget {
  final String textFieldTitle;
  final String time;
  const SelectTimeWidget({
    super.key,
    required this.textFieldTitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textFieldTitle,
          style: apptheme.typography.h400,
        ),
        Text(
          time,
          style: apptheme.typography.h300,
        ),
      ],
    );
  }
}
