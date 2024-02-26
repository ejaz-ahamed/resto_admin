import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/presentation/providers/order_provider.dart';
import 'package:resto_admin/features/orders/presentation/widgets/button_widget.dart';

class FoodStatus extends HookConsumerWidget {
  final List<OrderEntity> count;
  final TextEditingController clearController;
  const FoodStatus(
      {super.key, required this.count, required this.clearController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(orderpageConstantsProvider);

    /// Theme data
    final spaces = AppTheme.of(context).spaces;

    /// Tabs to show
    final tabsText = useMemoized(() => [
          {
            'text': constants.txtOrders,
            'type': OrderStatus.order,
          },
          {
            'text': constants.txtPreparing,
            'type': OrderStatus.preparing,
          },
          {
            'text': constants.txtCompleted,
            'type': OrderStatus.completed,
          },
          {
            'text': constants.txtRejct,
            'type': OrderStatus.rejected,
          }
        ]);

    /// Handle tapping on the tab items
    void tabOnPressed(int index) {
      ref
          .read(orderProvider.notifier)
          .changeTab(tabsText[index]['type'] as OrderStatus);
    }

    return SizedBox(
      height: spaces.space_500,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var i = 0; i < tabsText.length; i++)
            ButtonWidget(
              onPressed: () {
                tabOnPressed(i);
                clearController.clear();
                ref.read(orderProvider.notifier).clearSearchList();
              },
              text: tabsText[i]['text'] as String,
              isSelected: ref.watch(
                      orderProvider.select((value) => value.orderStatus)) ==
                  tabsText[i]['type'],
              ordersCount: switch (ref.watch(
                  getOrdersProvider(tabsText[i]['type'] as OrderStatus))) {
                AsyncData(:final value) => value.length,
                _ => 0,
              },
            )
        ],
      ),
    );
  }
}
