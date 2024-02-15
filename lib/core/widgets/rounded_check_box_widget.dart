import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

final isCheckedProvider = StateProvider<bool>((_) => false);

class RoundedCheckboxWidget extends HookConsumerWidget {
  final bool isChecked;
  final VoidCallback? onTap;
  const RoundedCheckboxWidget({
    super.key,
    this.isChecked = false,
    this.onTap,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: theme.spaces.space_100 * 2.5,
        height: theme.spaces.space_100 * 2.5,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isChecked ? theme.colors.primary : Colors.transparent,
          border: Border.all(
            color: theme.colors.primary,
            width: 2,
          ),
        ),
        child: isChecked
            ? Icon(
                Icons.check,
                size: theme.spaces.space_200,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
