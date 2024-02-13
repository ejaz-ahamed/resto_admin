import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/feature_orders/presentation/widgets/food_status.dart';
import 'package:resto_admin/feature_orders/presentation/widgets/orders_list_widget.dart';

class OrderScreenOne extends StatelessWidget {
  const OrderScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    final space = AppTheme.of(context).spaces;
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.secondary,
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: space.space_600,
          ),
          Padding(
            padding: EdgeInsets.only(left: space.space_200),
            child: const FoodStatus(),
          ),
          SizedBox(
            height: space.space_300,
          ),
          const OrderListView()
        ],
      ),
    );
  }
}
