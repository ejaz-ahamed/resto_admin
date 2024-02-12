import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class SizedBox32Widget extends StatelessWidget {
  const SizedBox32Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppTheme.of(context).spaces.space_400,
    );
  }
}
