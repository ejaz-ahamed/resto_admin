import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/profile_page/presentation/provider/profile_provider.dart';

class SwitchButton extends ConsumerWidget {
  const SwitchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, watch, _) {
      final switchstate = ref.watch(profileProvider);
      return Switch(
          trackOutlineWidth: const MaterialStatePropertyAll(0),
          activeColor: AppTheme.of(context).colors.text,
          inactiveThumbColor: AppTheme.of(context).colors.primary,
          value: switchstate,
          onChanged: (value) {
            ref.read(profileProvider.notifier).toggleTheme();
          });
    });
  }
}
