import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

final isCheckedProvider = StateProvider<bool>((_) => false);

class RoundedCheckboxWidget extends HookConsumerWidget {
  final bool isChecked;
  final ValueChanged<bool>? onChanged;
  final bool? isSelectAll;
  const RoundedCheckboxWidget({
    super.key,
    this.isChecked = false,
    this.onChanged,
    this.isSelectAll = false,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context).spaces;
    final isChecked = useState(this.isChecked);
    return GestureDetector(
      onTap: () {
        isChecked.value = !isChecked.value;
      },
      child: Container(
        width: appTheme.space_125 * 2,
        height: appTheme.space_125 * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isChecked.value
              ? AppTheme.of(context).colors.primary
              : Colors.transparent,
          border: Border.all(
            color: AppTheme.of(context).colors.primary,
            width: 2,
          ),
        ),
        child: isChecked.value
            ? Icon(
                Icons.check,
                size: appTheme.space_200,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
