import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class TextButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color color;
  final void Function()? onTap;

  const TextButtonWidget(
      {super.key,
      required this.buttonText,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(buttonText,
          style: AppTheme.of(context)
              .typography
              .h300
              .copyWith(color: AppTheme.of(context).colors.primary)),
    );
  }
}
