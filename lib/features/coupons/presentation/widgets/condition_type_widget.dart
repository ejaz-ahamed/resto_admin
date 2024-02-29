import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/elevated_add_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_16_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_8_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:resto_admin/features/coupons/presentation/widgets/dropdown_list_widget.dart';
import 'package:resto_admin/features/coupons/presentation/widgets/textfield_coupon_widget.dart';

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
            padding:
                EdgeInsets.only(bottom: AppTheme.of(context).spaces.space_200),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(apptheme.spaces.space_100),
                  border: Border.all(
                      color: AppTheme.of(context).colors.textInverse),
                  color: AppTheme.of(context).colors.secondary,
                  boxShadow: [AppTheme.of(context).boxShadow.primary]),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppTheme.of(context).spaces.space_300,
                    vertical: AppTheme.of(context).spaces.space_400),
                child: const Column(
                  children: [
                    DropDownWidget(
                      items: ["count", "amount"],
                    ),
                    SizedBox32Widget(),
                    DropDownWidget(
                      items: ["equal to", "greater than"],
                    ),
                    SizedBox32Widget(),
                    TextFieldCouponWidget(),
                    SizedBox32Widget(),
                    DropDownWidget(items: ['and', 'or']),
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
