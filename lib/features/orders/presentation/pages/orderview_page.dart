import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/button_container_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/customer_details_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/item_details_listview_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/item_details_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/orderview_page_appbar_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/profile_image_widget.dart';
import 'package:resto_admin/features/orders/presentation/widgets/total_row_widget.dart';

class OrderViewPage extends StatelessWidget {
  static const routePath = '/orderviewpage';
  const OrderViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: appTheme.colors.secondary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appTheme.spaces.space_100 * 5),
        child: const OrderviewPageAppBarWidget(),
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
            const CustomerDetailsWidget(),
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
