import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/products/presentation/widgets/edit_field_widget.dart';

class ProductTypeWidget extends HookConsumerWidget {
  final TextEditingController addOnController;
  final TextEditingController addOnPriceController;
  final String hint;
  final bool enabled;
  final TextStyle? style;
  const ProductTypeWidget(
      {super.key,
      required this.addOnController,
      required this.addOnPriceController,
      required this.hint,
      required this.enabled,
      required this.style});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    final selectedIndex = useState<int>(0);
    final types = useMemoized(() => []);
    void tabOnPressed(int index) {
      selectedIndex.value++;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 2; i++)
          Padding(
            padding: EdgeInsets.only(top: apptheme.spaces.space_200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: EditFieldWidget(
                    hintText: hint,
                    controller: addOnController,
                    enabled: enabled,
                    onChanged: null,
                    style: style,
                  ),
                ),
                Expanded(
                  child: EditFieldWidget(
                    hintText: "Enter price",
                    controller: addOnPriceController,
                    isPrice: true,
                    enabled: enabled,
                    style: style,
                    onChanged: (value) {
                      value = value.replaceAll('\$', '');
                      if (value.isNotEmpty) {
                        addOnPriceController.text = "\$$value";
                      }
                    },
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
