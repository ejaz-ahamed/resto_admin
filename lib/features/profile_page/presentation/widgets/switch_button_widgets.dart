import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/themes/theme_provider.dart';
import 'package:resto_admin/features/profile_page/presentation/providers/profile_provider.dart';

class SwitchButton extends ConsumerWidget {
  const SwitchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    return Consumer(builder: (context, watch, _) {
      final switchstate = ref.watch(profileProvider);
      return Switch(
          thumbIcon: MaterialStatePropertyAll(Icon(
            Icons.circle,
            color: colors.primary,
          )),
          trackOutlineColor: MaterialStatePropertyAll(colors.text),
          thumbColor: MaterialStatePropertyAll(colors.primary),
          trackColor: MaterialStatePropertyAll(colors.secondary),
          value: switchstate,
          onChanged: (value) {
            ref.read(profileProvider.notifier).toggleTheme();
            ref.read(themeProvider.notifier).switchTheme();
          });
    });
  }
}
