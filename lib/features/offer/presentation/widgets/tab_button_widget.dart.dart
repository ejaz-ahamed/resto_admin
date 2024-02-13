import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:resto_admin/core/themes/app_theme.dart';

class TabButtonWidget extends HookConsumerWidget {
  final String buttonText;
  final bool isSelected;
  final void Function()? onPressed;

  const TabButtonWidget(
      {super.key,
      required this.buttonText,
      required this.isSelected,
      required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Themedata
    final spaces = AppTheme.of(context).spaces;
    final color = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;

    final bgColor = isSelected ? color.primary : color.secondary;
    final borderColor = isSelected ? color.primary : color.textSubtlest;
    final textColor = isSelected ? color.secondary : color.textSubtlest;

    return Padding(
      padding: EdgeInsets.only(right: spaces.space_200),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 4.1,
        height: MediaQuery.sizeOf(context).height / 22,
        child: InkWell(
          onTap: onPressed,
          child: Container(
            decoration: BoxDecoration(
                color: bgColor,
                border: Border.all(color: borderColor),
                borderRadius: BorderRadius.circular(spaces.space_100)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: typography.h400.copyWith(color: textColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
