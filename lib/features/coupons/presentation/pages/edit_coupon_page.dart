import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/coupons_page_constants/edit_coupon_page_constants.dart';
import 'package:resto_admin/core/enums/coupon_type.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:resto_admin/features/coupons/domain/entities/condition_entity.dart';
import 'package:resto_admin/features/coupons/domain/entities/coupon_entity.dart';
import 'package:resto_admin/features/coupons/presentation/providers/coupon_condition_state.dart';
import 'package:resto_admin/features/coupons/presentation/providers/coupon_provider.dart';
import 'package:resto_admin/features/coupons/presentation/widgets/condition_type_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/tab_button_widget.dart.dart';
import 'package:resto_admin/features/products/presentation/widgets/heading_widget.dart';

class EditCouponPage extends HookConsumerWidget {
  static const routePath = '/editCouponPage';
  final CouponEntity entity;
  const EditCouponPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final codeController = useTextEditingController();
    final percentageController = useTextEditingController();

    final conditionsState = useState<List<CouponConditionState>>([
      for (final condition in entity.condition)
        CouponConditionState(
          andOr: condition.logic,
          condition: condition.check,
          countOrAmount: condition.count,
          valueController: TextEditingController()
            ..text = condition.value.toString(),
        )
    ]);
    final constants = ref.watch(editCouponPageConstantsProvider);

    //Theme data
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    final selectedCouponType = useState<CouponType>(entity.couponType);

    //Tabs to Show
    final tabsToShow = useMemoized(
      () => [
        {
          'text': constants.txtPercentageText,
          'type': CouponType.percentage,
        },
        {
          'text': constants.txtAmountText,
          'type': CouponType.amount,
        },
        {
          'text': constants.txtFreeDelivery,
          'type': CouponType.freeDelivery,
        },
      ],
    );

    useEffect(() {
      Future.delayed(
        Duration.zero,
        () {
          titleController.text = entity.title!;
          codeController.text = entity.code!;
          percentageController.text = entity.percentageOrAmount.toString();
        },
      );
      return null;
    }, []);

    //Handle tapping on the tab items
    void tabOnPressed(int index) {
      selectedCouponType.value = tabsToShow[index]['type'] as CouponType;
    }

    //update couponDetails
    void updateCouponDetails() {
      ref.read(couponProvider.notifier).updateCoupon(
          id: entity.id!,
          title: titleController.text,
          code: codeController.text,
          couponType: selectedCouponType.value,
          percentageOrAmount: double.parse(percentageController.text),
          conditions: [
            for (final i in conditionsState.value)
              ConditionEntity(
                  count: i.countOrAmount,
                  check: i.condition,
                  logic: i.andOr,
                  value: double.parse(i.valueController.text))
          ]);
      context.pop();
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppTheme.of(context).colors.secondary,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(spaces.space_700),
            child: AppBarWidget(
              title: constants.txtAppbarTitle,
              actionButtonName: constants.txtDelete,
              onPressed: () {
                ref.read(couponProvider.notifier).deleteCoupon(id: entity.id!);
                context.pop();
              },
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox32Widget(),
                TextFieldWidget(
                    enabled: true,
                    textFieldTitle: constants.txtTitle,
                    hintText: constants.txtHintTextTitle,
                    controller: titleController),
                const SizedBox32Widget(),
                TextFieldWidget(
                    maxLines: null,
                    enabled: true,
                    textFieldTitle: constants.txtCode,
                    hintText: constants.txtHintTextCode,
                    controller: codeController),
                const SizedBox32Widget(),
                Text(
                  constants.txtType,
                  style: typography.h400,
                ),
                const SizedBox32Widget(),
                Row(
                  children: [
                    for (var i = 0; i < tabsToShow.length; i++)
                      TabButtonWidget(
                        buttonText: tabsToShow[i]['text'] as String,
                        isSelected:
                            selectedCouponType.value == tabsToShow[i]['type'],
                        onPressed: () => tabOnPressed(i),
                      ),
                  ],
                ),
                const SizedBox32Widget(),
                if (selectedCouponType.value == CouponType.percentage ||
                    selectedCouponType.value == CouponType.amount)
                  TextFieldWidget(
                      enabled: true,
                      textFieldTitle:
                          selectedCouponType.value == CouponType.percentage
                              ? 'Coupon Percentage'
                              : 'Coupon Amount',
                      hintText:
                          selectedCouponType.value == CouponType.percentage
                              ? constants.txtHintTextPercentag
                              : constants.txtHintTextAmount,
                      controller: percentageController)
                else
                  HeadingWidget(text: constants.txtFreeDeliveryApply),
                const SizedBox32Widget(),
                HeadingWidget(text: constants.txtCondition),
                const SizedBox32Widget(),
                ConditionTypeWidget(
                  conditionsState: conditionsState,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ElevatedButtonWidget(
          text: constants.txtSave,
          onPressed: updateCouponDetails,
        ),
      ),
    );
  }
}
