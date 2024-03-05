import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/elevated_add_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/features/coupons/presentation/widgets/dropdown_list_widget.dart';
import 'package:resto_admin/features/coupons/presentation/widgets/textfield_coupon_widget.dart';

/// Model class to handle the text editing controller
final class ConditionControllers {
  final TextEditingController valueController;
  final String countOrAmount;
  final String logic;
  final String andOr;

  ConditionControllers({required this.valueController,required this.countOrAmount,required this.logic,required this.andOr});
}

class ConditionTypeWidget extends HookConsumerWidget {
  final TextStyle? style;
  final ValueNotifier<List<ConditionControllers>> productTypes;
  final String btntxt;
  

  final void Function(String)? onChange;
  final TextEditingController? controller;

  const ConditionTypeWidget({
    super.key,
    required this.style,
    required this.productTypes,
    required this.btntxt,
    required this.controller,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);

    void addNewTypeEntry() {
      productTypes.value = [
        ...productTypes.value,
        ConditionControllers(
          valueController: TextEditingController(),
          andOr: '',
          countOrAmount:'',
          logic:'' ,
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
                child: Column(
                  children: [
                    DropDownWidget(
                      items: const ["count", "amount"],
                      onChange: (value) {
                        value;
                      },
                    ),
                    const SizedBox32Widget(),
                    DropDownWidget(
                      items: const ["equal to", "greater than", "less than"],
                      onChange: (value) {
                        value;
                      },
                    ),
                    const SizedBox32Widget(),
                    TextFieldCouponWidget(
                      controller:controller ,
                    ),
                    const SizedBox32Widget(),
                    DropDownWidget(
                      items: const ['and', 'or'],
                      onChange: (value) {
                        value;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        const SizedBox24Widget(),
        ElevatedAddButtonWidget(
            buttonText: btntxt,
            textColor: apptheme.colors.primary,
            onPressed:  addNewTypeEntry,
            icon: Icons.add),
      ],
    );
  }
}
