import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/coupons/presentation/pages/coupons_page.dart';
import 'package:resto_admin/features/offer/presentation/pages/offer_page.dart';

class OfferCouponTabBarWidget extends ConsumerWidget {
  const OfferCouponTabBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// theme data
    final color = AppTheme.of(context).colors;
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: TabBar(
                labelColor: color.primary,
                indicatorColor: color.primary,
                tabs: const [
                  Tab(
                    text: 'Offers',
                  ),
                  Tab(
                    text: 'Coupons',
                  )
                ],
              ),
            ),
            body: const TabBarView(children: [OfferPage(), CouponsPage()]),
          ),
        ));
  }
}
