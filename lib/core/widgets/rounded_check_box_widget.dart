import 'package:flutter/material.dart';
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isChecked
              ? AppTheme.of(context).colors.primary
              : Colors.transparent,
          border: Border.all(
            color: AppTheme.of(context).colors.primary,
            width: 2,
          ),
        ),
        child: isChecked
            ? const Icon(
                Icons.check,
                size: 16,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
