import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/presentation/widgets/text_widget.dart';

class ItemDetailsWidget extends ConsumerWidget {
  const ItemDetailsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(orderpageConstantsProvider);
    final appTheme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: appTheme.spaces.space_300),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: appTheme.colors.textSubtle,
            width: appTheme.spaces.space_25,
          ),
        )),
        child: Padding(
          padding: EdgeInsets.all(appTheme.spaces.space_100 * 1.25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(text: constants.items),
              SizedBox(
                width: appTheme.spaces.space_500 * 4.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(text: constants.type),
                    TextWidget(text: constants.quantity),
                    TextWidget(text: constants.price),
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
