import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/offer_constants/add_offer_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/image_picker_widget.dart';
import 'package:resto_admin/features/offer/presentation/pages/add_offer_page.dart';
import 'package:resto_admin/features/offer/presentation/pages/offer_page.dart';

class OfferCouponTabBarWidget extends ConsumerWidget {
  const OfferCouponTabBarWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    /// theme data
     final color = AppTheme.of(context).colors;
    final constants = AddOfferPageConstants();
    final theme = AppTheme.of(context);
    return DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: SafeArea(
          child: Scaffold(
            appBar: TabBar(
              
                labelColor: color.primary,
                indicatorColor: color.primary,
                tabs: const [
                  Tab(
                    text: 'Offers',
                  ),
                  Tab(
                    text: 'Coupons',
                  )
                ]),
            body:const TabBarView(children: [OfferPage(), OfferPage()]),
              floatingActionButton:
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding:const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  backgroundColor: color.primary ),
              onPressed: () {
                ref.read(imageProvider.notifier).state = null;
                context.push(AddOfferPage.routePath);
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
          ),
        ));
  }
}
