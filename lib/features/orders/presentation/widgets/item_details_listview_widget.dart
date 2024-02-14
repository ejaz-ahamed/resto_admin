import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/presentation/widgets/text_regular_widget.dart';

class ItemsDetailsListviewDetails extends ConsumerWidget {
  const ItemsDetailsListviewDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(orderpageConstantsProvider);
    final appTheme = AppTheme.of(context);
    return SizedBox(
      height: appTheme.spaces.space_500 * 4,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: appTheme.spaces.space_300),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(appTheme.spaces.space_100 * 1.25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextRegularWidget(text: constants.txtitems),
                    SizedBox(
                      width: appTheme.spaces.space_500 * 4.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextRegularWidget(text: constants.txttype),
                          TextRegularWidget(text: constants.txtquantity),
                          TextRegularWidget(text: constants.txtprice),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
