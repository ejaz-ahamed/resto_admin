import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/presentation/widgets/button_container_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/customer_details_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/item_details_listview_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/item_details_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/profile_image_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/total_row_widget.dart';

class OrderViewPage extends ConsumerWidget {
  static const routePath = '/orderviewpage';
  final OrderEntity entity;
  const OrderViewPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    final constants = ref.watch(orderpageConstantsProvider);
    return Scaffold(
      backgroundColor: appTheme.colors.secondary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appTheme.spaces.space_700),
        child: AppBarWidget(
          title: constants.txtOrderDetails,
          actionButtonName: constants.txtPrint,
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
            ),
            const SizedBox24Widget(),
            const ProfileImageWidget(),
            const SizedBox32Widget(),
            CustomerDetailsWidget(entity: entity),
            const SizedBox24Widget(),
            const ItemDetailsWidget(),
            const ItemsDetailsListviewDetails(),
            const TotalRowWidget(),
          ],
        ),
      ),
      bottomNavigationBar: const ButtonContainerWidget(),
    );
  }
}
