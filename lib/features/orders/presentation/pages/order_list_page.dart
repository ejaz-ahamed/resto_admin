import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/features/orders/presentation/providers/order_provider.dart';
import 'package:resto_admin/features/orders/presentation/widgets/food_status.dart';
import 'package:resto_admin/features/orders/presentation/widgets/orders_list_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/search_textfield_widget.dart';

class OrdersListPage extends HookConsumerWidget {
  const OrdersListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final select =
        ref.watch(orderProvider.select((value) => value.orderStatus));

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
          constants.txtOrders,
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
                padding: EdgeInsets.symmetric(horizontal: space.space_300),
                child: ref.watch(getOrdersProvider(select)).when(
                  data: (data) {
                    final datas = ref.watch(orderProvider).searchOrder ?? data;
                    return Column(
                      children: [
                        FoodStatus(
                          count: datas,
                          clearController: searchController,
                        ),
                        SizedBox(
                          height: space.space_300,
                        ),
                        OrderListView(entity: datas),
                      ],
                    );
                  },
                  error: (Object error, StackTrace stackTrace) {
                    return const Center(
                      child: Text(''),
                    );
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
