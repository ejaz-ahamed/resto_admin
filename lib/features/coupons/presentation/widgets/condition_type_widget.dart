import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/coupons_page_constants/add_coupon_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/elevated_add_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_16_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/features/coupons/data/models/condition_model.dart';
import 'package:resto_admin/features/coupons/presentation/providers/coupon_condition_state.dart';
import 'package:resto_admin/features/coupons/presentation/widgets/dropdown_list_widget.dart';
import 'package:resto_admin/features/coupons/presentation/widgets/textfield_coupon_widget.dart';

class ConditionTypeWidget extends HookConsumerWidget {
  final ValueNotifier<List<CouponConditionState>> conditionsState;

  const ConditionTypeWidget({
    super.key,
    required this.conditionsState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    final constants = ref.watch(addCouponPageConstantsProvider);

    /// Add a new condition for the coupon
    void addNewConditionEntry() {
      conditionsState.value = [
        ...conditionsState.value,
        CouponConditionState(
          valueController: TextEditingController(),
          andOr: ConditionLogic.values.first,
          countOrAmount: ConditionType.values.first,
          condition: ConditionCheck.values.first,
        ),
      ];
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          separatorBuilder: (context, index) => const SizedBox16Widget(),
          itemCount: conditionsState.value.length,
          itemBuilder: (context, index) {
            final currentCondition = conditionsState.value[index];

            return Padding(
              padding: EdgeInsets.only(
                  bottom: AppTheme.of(context).spaces.space_200),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropDownWidget(
                        initalValue: currentCondition.countOrAmount.name,
                        items: ConditionType.values.map((e) => e.name).toList(),
                        onChange: (value) {
                          conditionsState.value[index] =
                              currentCondition.copyWith(
                                  countOrAmount:
                                      ConditionType.values.byName(value));
                        },
                      ),
                      const SizedBox32Widget(),
                      DropDownWidget(
                        initalValue: currentCondition.condition.name,
                        items:
                            ConditionCheck.values.map((e) => e.name).toList(),
                        onChange: (value) {
                          conditionsState.value[index] =
                              currentCondition.copyWith(
                                  condition:
                                      ConditionCheck.values.byName(value));
                        },
                      ),
                      const SizedBox32Widget(),
                      TextFieldCouponWidget(
                        controller: currentCondition.valueController,
                      ),
                      const SizedBox32Widget(),
                      DropDownWidget(
                        initalValue: currentCondition.andOr.name,
                        items:
                            ConditionLogic.values.map((e) => e.name).toList(),
                        onChange: (value) {
                          conditionsState.value[index] =
                              currentCondition.copyWith(
                                  andOr: ConditionLogic.values.byName(value));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox24Widget(),
        ElevatedAddButtonWidget(
            buttonText: constants.txtCondition,
            textColor: apptheme.colors.primary,
            onPressed: addNewConditionEntry,
            icon: Icons.add),
      ],
    );
  }
}
