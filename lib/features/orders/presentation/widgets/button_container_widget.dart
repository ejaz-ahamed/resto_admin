import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/presentation/providers/order_provider.dart';
import 'package:resto_admin/features/orders/presentation/widgets/button_bottom_widget.dart';

class ButtonContainerWidget extends ConsumerWidget {
  final OrderEntity entity;

  const ButtonContainerWidget({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(orderpageConstantsProvider);
    final appTheme = AppTheme.of(context);

    final List<Widget> buttonsToShow = switch (entity.orderStatus) {
      OrderStatus.order => [
          Expanded(
            child: ButtonWidget(
              text: constants.txtRejct,

              /// Reject the order
              onPressed: () async {
                await ref
                    .read(orderProvider.notifier)
                    .updateOrderType(entity.id, OrderStatus.rejected);
                Future.sync(() => context.pop());
              },
              color: appTheme.colors.secondary,
              borderColor: appTheme.colors.textSubtle,
              textColor: appTheme.colors.text,
            ),
          ),
          SizedBox(width: appTheme.spaces.space_200),
          Expanded(
            child: ButtonWidget(
              text: constants.txtAccept,

              /// Accept the order
              onPressed: () async {
                await ref
                    .read(orderProvider.notifier)
                    .updateOrderType(entity.id, OrderStatus.preparing);
                Future.sync(() => context.pop());
              },
              color: appTheme.colors.primary,
              borderColor: appTheme.colors.primary,
              textColor: appTheme.colors.secondary,
            ),
          ),
        ],
      OrderStatus.preparing => [
          Expanded(
            child: ButtonWidget(
              text: constants.txtMarkCompletedBtnLabel,

              /// Mark the order as completed
              onPressed: () async {
                await ref
                    .read(orderProvider.notifier)
                    .updateOrderType(entity.id, OrderStatus.completed);
                Future.sync(() => context.pop());
              },
              color: appTheme.colors.primary,
              borderColor: appTheme.colors.primary,
              textColor: appTheme.colors.secondary,
            ),
          ),
        ],
      OrderStatus.completed => [
          Expanded(
            child: ButtonWidget(
              text: constants.txtMoveToPreparing,

              /// Move the order to preparing
              onPressed: () async {
                await ref
                    .read(orderProvider.notifier)
                    .updateOrderType(entity.id, OrderStatus.preparing);
                Future.sync(() => context.pop());
              },
              color: appTheme.colors.primary,
              borderColor: appTheme.colors.primary,
              textColor: appTheme.colors.secondary,
            ),
          ),
        ],
      OrderStatus.rejected => [
          Expanded(
            child: ButtonWidget(
              text: constants.txtMoveToOrder,

              /// Move to orders
              onPressed: () async {
                await ref
                    .read(orderProvider.notifier)
                    .updateOrderType(entity.id, OrderStatus.order);
                Future.sync(() => context.pop());
              },
              color: appTheme.colors.primary,
              borderColor: appTheme.colors.primary,
              textColor: appTheme.colors.secondary,
            ),
          ),
        ],
    };

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: appTheme.spaces.space_300,
        vertical: appTheme.spaces.space_200,
      ),
      child: SizedBox(
        child: Row(
          children: buttonsToShow,
        ),
      ),
    );
  }
}
