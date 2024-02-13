import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/profile_page/presentation/providers/switch_button_provider.dart';

class SwitchButton extends ConsumerWidget {
  const SwitchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(builder: (context, watch, _) {
      final switchstate = ref.watch(switchprovider);
      return Switch(
          activeColor: AppTheme.of(context).colors.primary,
          value: switchstate,
          onChanged: (value) {
            ref.read(switchprovider.notifier).state = value;
          });
    });
  }
}
