import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class ButtonWidget extends ConsumerWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;
  final Color borderColor;
  final Color textColor;

  const ButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color,
      required this.borderColor,
      required this.textColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return Container(
      height: appTheme.spaces.space_500 * 1.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          appTheme.spaces.space_100,
        ),
        border: Border.all(
          color: borderColor,
        ),
        color: color,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: appTheme.typography.h300.copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
