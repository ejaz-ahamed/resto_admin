import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/presentation/widgets/text_regular_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/text_widget.dart';

class CustomerDetailsWidget extends ConsumerWidget {
  const CustomerDetailsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(orderpageConstantsProvider);
    final appTheme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: appTheme.spaces.space_300,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              appTheme.spaces.space_100,
            ),
            border: Border.all(
              color: appTheme.colors.textSubtle,
            )),
        child: Padding(
          padding: EdgeInsets.all(appTheme.spaces.space_200),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextWidget(text: constants.txtorderId),
                  TextWidget(text: constants.txtcustomerName),
                  TextWidget(text: constants.txttime),
                  TextWidget(text: constants.txtlocation),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextRegularWidget(text: constants.txtorderId),
                  TextRegularWidget(text: constants.txtcustomerName),
                  TextRegularWidget(text: constants.txttime),
                  TextRegularWidget(text: constants.txtlocation),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
