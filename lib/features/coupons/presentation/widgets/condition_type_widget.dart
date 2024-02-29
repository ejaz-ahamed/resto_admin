import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/elevated_add_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/features/coupons/presentation/widgets/dropdown_list_widget.dart';

/// Model class to handle the text editing controller
final class ProductTypeControllers {
  final TextEditingController typeController;
  final TextEditingController conditionController;
  final TextEditingController valueController;

  ProductTypeControllers(
      {required this.conditionController,
      required this.typeController,
      required this.valueController});
}

class ConditionTypeWidget extends HookConsumerWidget {
  final String hint;
  final TextStyle? style;
  final ValueNotifier<List<ProductTypeControllers>> productTypes;
  final String btntxt;
  final void Function(int) onTap;

  const ConditionTypeWidget({
    super.key,
    required this.hint,
    required this.style,
    required this.productTypes,
    required this.btntxt,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);

    void addNewTypeEntry() {
      productTypes.value = [
        ...productTypes.value,
        ProductTypeControllers(
          conditionController: TextEditingController(),
          typeController: TextEditingController(),
          valueController: TextEditingController(),
        ),
      ];
    }

    return Column(
      children: [
        for (var i = 0; i < productTypes.value.length; i++)
          Padding(
            padding: EdgeInsets.only(top: apptheme.spaces.space_200),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: AppTheme.of(context).colors.textDisabled),
                  color: AppTheme.of(context).colors.secondary,
                  boxShadow: [AppTheme.of(context).boxShadow.primary]),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppTheme.of(context).spaces.space_200,
                    vertical: AppTheme.of(context).spaces.space_200),
                child:const Column(
                  children: [
                    DropDownWidget(
                      items: ["One", "Two"],
                    ),
                    DropDownWidget(
                      items: ["Sanju", "Fasil"],
                    ),
                    DropDownWidget(
                      items: ["Sireen", "Sinan"],
                    ),
                    // TextFieldWidget(
                    //   enabled: true,
                    //   textFieldTitle: 'Conditions',
                    //   hintText: 'Equal to',
                    //   controller: productTypes.value[i].conditionController,
                    // ),
                    // TextFieldWidget(
                    //   enabled: true,
                    //   textFieldTitle: 'Value',
                    //   hintText: 'number',
                    //   controller: productTypes.value[i].valueController,
                    // ),
                  ],
                ),
              ),
            ),
          ),
        const SizedBox24Widget(),
        ElevatedAddButtonWidget(
            buttonText: btntxt,
            textColor: apptheme.colors.primary,
            onPressed: () => addNewTypeEntry(),
            icon: Icons.add),
      ],
    );
  }
}
