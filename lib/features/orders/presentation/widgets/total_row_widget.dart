import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/presentation/widgets/text_widget.dart';

class TotalRowWidget extends ConsumerWidget {
  const TotalRowWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(orderpageConstantsProvider);
    final appTheme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: appTheme.spaces.space_300),
      child: Container(
        decoration: BoxDecoration(
            border: Border.symmetric(
          horizontal: BorderSide(
            color: appTheme.colors.textSubtle,
            width: appTheme.spaces.space_25,
          ),
        )),
        child: Padding(
          padding: EdgeInsets.all(appTheme.spaces.space_100 * 1.25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: constants.txttotal,
              ),
              SizedBox(
                width: appTheme.spaces.space_500 * 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(text: constants.txtquantity),
                    TextWidget(text: constants.txtprice),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
