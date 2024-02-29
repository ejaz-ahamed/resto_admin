import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/coupons_page_constants/add_coupon_page_constants.dart';
import 'package:resto_admin/core/enums/offer_type.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_16_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:resto_admin/features/coupons/presentation/widgets/condition_type_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/tab_button_widget.dart.dart';
import 'package:resto_admin/features/products/presentation/widgets/heading_widget.dart';

class AddCouponPage extends HookConsumerWidget {
  static const routePath = '/addcouponpage';
  const AddCouponPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final percentageController = useTextEditingController();
    final conditionTypeController = useState<List<ProductTypeControllers>>([]);
    final constants = ref.watch(addCouponPageConstantsProvider);
    //Theme data
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;

    final selectedOfferType = useState<OfferType>(OfferType.percentage);

    //Tabs to Show
    final tabsToShow = useMemoized(
      () => [
        {
          'text': constants.txtPercentageText,
          'type': OfferType.percentage,
        },
        {
          'text': constants.txtAmountText,
          'type': OfferType.amount,
        },
        {
          'text': constants.txtFreeDelivery,
        },
      ],
    );

    //Handle tapping on the tab items
    void tabOnPressed(int index) {
      selectedOfferType.value = tabsToShow[index]['type'] as OfferType;
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppTheme.of(context).colors.secondary,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(spaces.space_700),
            child: AppBarWidget(title: constants.txtAppbarTitle)),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox24Widget(),
                TextFieldWidget(
                    enabled: true,
                    textFieldTitle: constants.txtTitle,
                    hintText: constants.txtHintTextTitle,
                    controller: nameController),
                const SizedBox32Widget(),
                TextFieldWidget(
                    maxLines: null,
                    enabled: true,
                    textFieldTitle: constants.txtCode,
                    hintText: constants.txtHintTextCode,
                    controller: descriptionController),
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
                            selectedOfferType.value == tabsToShow[i]['type'],
                        onPressed: () => tabOnPressed(i),
                      ),
                  ],
                ),
                const SizedBox32Widget(),
                TextFieldWidget(
                    enabled: true,
                    textFieldTitle:
                        selectedOfferType.value == OfferType.percentage
                            ? 'Coupon Percentage'
                            : 'Coupon Amount',
                    hintText: selectedOfferType.value == OfferType.percentage
                        ? constants.txtHintTextPercentag
                        : constants.txtHintTextAmount,
                    controller: percentageController),
                const SizedBox32Widget(),
                HeadingWidget(text: constants.txtCondition),
                const SizedBox16Widget(),
                ConditionTypeWidget(
                  hint: 'sss',
                  style: AppTheme.of(context).typography.h300,
                  productTypes: conditionTypeController,
                  btntxt: constants.txtCondition,
                  onTap: (p0) {},
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: ElevatedButtonWidget(
          text: constants.txtSave,
          onPressed: () {},
        ),
      ),
    );
  }
}
