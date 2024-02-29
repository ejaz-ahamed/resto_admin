import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/coupons_page_constants/add_coupon_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/coupons/presentation/pages/add_coupon_page.dart';
import 'package:resto_admin/features/coupons/presentation/widgets/coupon_banner_widget.dart';

class CouponsPage extends StatelessWidget {
  const CouponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.of(context).colors;
    final theme = AppTheme.of(context);
    final constants = AddCouponPageConstants();
    return Scaffold(
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              CouponBannerWidget(),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              backgroundColor: color.primary),
          onPressed: () {
            context.push(AddCouponPage.routePath);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add,
                color: color.secondary,
              ),
              SizedBox(
                width: theme.spaces.space_50,
              ),
              Text(constants.txtAdd,
                  style: theme.typography.h300.copyWith(
                    color: color.secondary,
                  ))
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
