import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class AddOnButtonWidget extends StatelessWidget {
  final String buttonText;

  final Color textColor;
  final void Function()? onPressed;
  final IconData? icon;

  const AddOnButtonWidget(
      {super.key,
      required this.buttonText,
      required this.textColor,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height / 18,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            side: BorderSide(color: AppTheme.of(context).colors.primary),
            elevation: 0,
            backgroundColor: AppTheme.of(context).colors.secondary,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(
                    AppTheme.of(context).spaces.space_250))),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: AppTheme.of(context).colors.primary,
              size: AppTheme.of(context).spaces.space_250,
            ),
            SizedBox(
              width: AppTheme.of(context).spaces.space_100,
            ),
            Text(
              buttonText,
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
