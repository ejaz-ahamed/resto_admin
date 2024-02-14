import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/orders_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/presentation/widgets/button_widget.dart';

class FoodStatus extends HookConsumerWidget {
  const FoodStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(orderpageConstantsProvider);

    /// Theme data
    final spaces = AppTheme.of(context).spaces;

    /// Selected tab
    final selectedIndex = useState<int>(0);

    /// Tabs to show
    final tabsText = useMemoized(() => [
          constants.orders,
          constants.preparing,
          constants.completed,
        ]);

    /// Handle tapping on the tab items
    void tabOnPressed(int index) {
      selectedIndex.value = index;
    }

    return SizedBox(
      height: spaces.space_500,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            children: [
              for (var i = 0; i < tabsText.length; i++)
                ButtonWidget(
                  onPressed: () => tabOnPressed(i),
                  text: tabsText[i],
                  isSelected: selectedIndex.value == i,
                  foodCount: 12,
                ),
            ],
          )
        ],
      ),
    );
  }
}
