import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/sized_box_16_widget.dart';

class ColumnWidget extends StatelessWidget {
  final String name;
  final String price;
  const ColumnWidget({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: AppTheme.of(context).typography.h300,
            ),
            Text(
              price,
              style: AppTheme.of(context).typography.h300,
            )
          ],
        ),
        const SizedBox16Widget(),
      ],
    );
  }
}
