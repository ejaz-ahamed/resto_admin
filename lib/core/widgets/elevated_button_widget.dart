import 'package:flutter/material.dart';
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
