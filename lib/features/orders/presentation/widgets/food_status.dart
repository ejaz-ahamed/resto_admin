import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/presentation/widgets/button_widget.dart';

class FoodStatus extends HookConsumerWidget {
  final List<OrderEntity> count;
  const FoodStatus({super.key, required this.count});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(orderpageConstantsProvider);

    /// Theme data
    final spaces = AppTheme.of(context).spaces;

    /// Selected tab
    final selectedIndex = useState<OrderType>(OrderType.order);

    /// Tabs to show
    final tabsText = useMemoized(() => [
          {
            'text': constants.txtOrders,
            'type': OrderType.order,
          },
          {
            'text': constants.txtPreparing,
            'type': OrderType.preparing,
          },
          {
            'text': constants.txtCompleted,
            'type': OrderType.completed,
          },
          {
            'text': constants.txtRejct,
            'type': OrderType.rejected,
          }
        ]);

    /// Handle tapping on the tab items
    void tabOnPressed(int index) {
      selectedIndex.value = tabsText[index]['type'] as OrderType;
    }

    return SizedBox(
      height: spaces.space_500,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var i = 0; i < tabsText.length; i++)
            ButtonWidget(
              onPressed: () => tabOnPressed(i),
              text: tabsText[i]['text'] as String,
              isSelected: selectedIndex.value == tabsText[i]['type'],
              foodCount: count.length,
            )
        ],
      ),
    );
  }
}
