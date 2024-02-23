import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:resto_admin/core/constants/app_constants.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/domain/entity/order_item_entity.dart';
import 'package:resto_admin/features/orders/presentation/widgets/text_widget.dart';

class TotalRowWidget extends ConsumerWidget {
  final List<OrderItemEntity> items;

  const TotalRowWidget({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(orderpageConstantsProvider);
    final appTheme = AppTheme.of(context);

    /// The total amount
    final totalAmount = items.fold<double>(
        0,
        (prev, item) =>
            double.parse(item.product.types
                    .where((type) => type.id == item.type)
                    .first
                    .price) *
                item.quantity +
            prev);

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
              Expanded(
                child: TextWidget(
                  text: constants.txtTotal,
                ),
              ),
              TextWidget(
                text: NumberFormat.currency(
                        symbol: ref.watch(appConstantsProvider).moneySymbol)
                    .format(totalAmount),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
