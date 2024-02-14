import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/food_status.dart';
import 'package:resto_admin/features/orders/presentation/widgets/orders_list_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/search_textfield_widget.dart';

class OrderScreenOne extends HookConsumerWidget {
  const OrderScreenOne({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final space = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    final colors = AppTheme.of(context).colors;
    final constants = ref.watch(orderpageConstantsProvider);
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.secondary,
      appBar: AppBar(
        backgroundColor: colors.secondary,
        titleSpacing: space.space_300,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          constants.txtorders,
          style: typography.h800,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox32Widget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: space.space_300),
              child: TextFieldSearchWidget(searchController: searchController),
            ),
            SizedBox(
              height: space.space_400,
            ),
            Padding(
              padding: EdgeInsets.only(left: space.space_300),
              child: const FoodStatus(),
            ),
            SizedBox(
              height: space.space_300,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: space.space_300),
              child: const OrderListView(),
            )
          ],
        ),
      ),
    );
  }
}
