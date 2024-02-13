import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class ButtonWidget extends ConsumerWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;
  final int foodCount;

  const ButtonWidget({
    super.key,
    required this.foodCount,
    required this.isSelected,
    required this.onPressed,
    required this.text,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final space = AppTheme.of(context).spaces;
    final colors = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;

    /// Background color to use for the button
    final bgColor = isSelected ? colors.primary : colors.secondary;

    /// Text color to use for the button
    final textColor = isSelected ? colors.textInverse : colors.text;

    return Container(
      padding: EdgeInsets.only(right: space.space_200),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(space.space_100))),
        child: Row(
          children: [
            Text(
              text,
              style: typography.h300.copyWith(color: textColor),
            ),
            SizedBox(
              width: space.space_50,
            ),
            Container(
              height: space.space_300,
              width: space.space_300,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: space.space_25,
                      color: isSelected ? colors.primary : colors.textInverse),
                  borderRadius: BorderRadius.circular(space.space_300),
                  color: colors.secondary),
              child: Text(foodCount.toString()),
            )
          ],
        ),
      ),
    );
  }
}
