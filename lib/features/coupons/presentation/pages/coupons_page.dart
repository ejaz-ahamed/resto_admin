import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/coupons_page_constants/add_coupon_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/coupons/presentation/pages/add_coupon_page.dart';
import 'package:resto_admin/features/coupons/presentation/providers/coupon_provider.dart';
import 'package:resto_admin/features/coupons/presentation/widgets/coupon_banner_widget.dart';

class CouponsPage extends ConsumerWidget {
  const CouponsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = AppTheme.of(context).colors;
    final theme = AppTheme.of(context);
    final constants = AddCouponPageConstants();
    return Scaffold(
      body: switch (ref.watch(getCouponsProvider)) {
        AsyncData(:final value) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                children: [
                  CouponBannerWidget(
                    entity: value,
                  ),
                ],
              ),
            ),
          ),
        AsyncError() => const Center(
            child: Text('error'),
          ),
        _ => const Center(
            child: CircularProgressIndicator(),
          )
      },
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
