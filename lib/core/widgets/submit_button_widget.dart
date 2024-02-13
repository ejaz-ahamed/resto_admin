import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color borderColor;
  final Color filledColor;
  final Color textColor;
  final void Function()? onPressed;
  const ElevatedButtonWidget(
      {super.key,
      required this.buttonText,
      required this.borderColor,
      required this.filledColor,
      required this.textColor,
      required this.onPressed});
  @override
  Widget build(BuildContext context) {
    final typography = AppTheme.of(context).typography;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height / 17,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            side: BorderSide(color: borderColor),
            elevation: 0,
            backgroundColor: filledColor,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: typography.h500,
        ),
      ),
    );
  }
}
