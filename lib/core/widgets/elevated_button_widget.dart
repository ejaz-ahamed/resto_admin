import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:resto_admin/core/themes/app_theme.dart';
class ElevatedAddButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color textColor;
  final void Function()? onPressed;
  final IconData? icon;
  const ElevatedAddButtonWidget(
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
              style:
                  TextStyle(color: textColor, fontFamily: 'inter'),
            ),
          ],
        ),
      ),
    );
  }
}
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class ElevatedButtonWidget extends ConsumerWidget {
  final String text;
  final void Function() onPressed;
  const ElevatedButtonWidget(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: appTheme.spaces.space_300,
          horizontal: appTheme.spaces.space_300),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height / 18,
        width: MediaQuery.sizeOf(context).width,
        child: ElevatedButton(
            style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0),
                backgroundColor:
                    MaterialStatePropertyAll(appTheme.colors.primary),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(appTheme.spaces.space_100)))),
            onPressed: onPressed,
            child: Text(
              text,
              style: appTheme.typography.uiSemibold
                  .copyWith(color: appTheme.colors.secondary),
            )),
      ),
    );
  }
}
>>>>>>> main
