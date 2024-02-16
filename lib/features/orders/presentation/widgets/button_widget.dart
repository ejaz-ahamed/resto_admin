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

    ///Border color to use for the buttom
    final borderColor = isSelected ? colors.primary : colors.textSubtle;

    /// Text color to use for the button
    final textColor = isSelected ? colors.textInverse : colors.text;

    return Container(
      padding: EdgeInsets.only(right: space.space_200),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(space.space_100),
          ),
        ),
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
              padding: EdgeInsets.all(space.space_25),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: space.space_25,
                      color: isSelected ? colors.primary : colors.textInverse),
                  shape: BoxShape.circle,
                  color: colors.secondary),
              child: Center(
                child: Text(
                  foodCount.toString(),
                  style: typography.h100
                      .copyWith(fontSize: space.space_125, color: colors.text),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
