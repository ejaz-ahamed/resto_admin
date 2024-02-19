import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/presentation/providers/order_provider.dart';
import 'package:resto_admin/features/orders/presentation/widgets/button_bottom_widget.dart';

class ButtonContainerWidget extends ConsumerWidget {
  final OrderEntity entity;
  final void Function() onPressed;
  const ButtonContainerWidget(
      {super.key, required this.entity, required this.onPressed});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(orderpageConstantsProvider);
    final appTheme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: appTheme.spaces.space_300,
        vertical: appTheme.spaces.space_200,
      ),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonWidget(
              text: constants.txtRejct,
              onPressed: () {
                ref
                    .read(orderProvider.notifier)
                    .updateOrderType(entity.orderId, OrderType.rejected);
              },
              color: appTheme.colors.secondary,
              borderColor: appTheme.colors.textSubtle,
              textColor: appTheme.colors.text,
            ),
            ButtonWidget(
              text: constants.txtAccept,
              onPressed: onPressed,
              color: appTheme.colors.primary,
              borderColor: appTheme.colors.primary,
              textColor: appTheme.colors.secondary,
            )
          ],
        ),
      ),
    );
  }
}
