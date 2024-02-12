import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/constants/profile_page/profile_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class ElevatedButtonWidget extends ConsumerWidget {
  const ElevatedButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              minimumSize: Size(MediaQuery.sizeOf(context).width, 55),
              backgroundColor: apptheme.colors.primary),
          onPressed: () {},
          child: Text(
            ref.watch(profilePageProvider).txtEdit,
            style: TextStyle(color: apptheme.colors.secondary),
          )),
    );
  }
}
