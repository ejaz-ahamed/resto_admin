import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class DropDownWidget extends HookConsumerWidget {
  final List<String> items;
  final void Function(String value)? onChange;
  final String? initalValue;

  const DropDownWidget({
    super.key,
    required this.items,
    required this.onChange,
    this.initalValue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dropdownValue = useState<String>(initalValue ?? items.first);

    return Column(
      children: [
        Container(
          height: AppTheme.of(context).spaces.space_700,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border:
                  Border.all(color: AppTheme.of(context).colors.textSubtle)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppTheme.of(context).spaces.space_200),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue.value,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                style: TextStyle(color: AppTheme.of(context).colors.secondary),
                onChanged: (String? value) {
                  if (value != null) {
                    dropdownValue.value = value;
                    onChange?.call(value);
                  }
                },
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: AppTheme.of(context)
                          .typography
                          .h300
                          .copyWith(color: AppTheme.of(context).colors.text),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
