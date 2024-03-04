import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/offer_constants/add_offer_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/image_picker_widget.dart';
import 'package:resto_admin/features/offer/presentation/pages/add_offer_page.dart';
import 'package:resto_admin/features/offer/presentation/provider/offer_provider.dart';
import 'package:resto_admin/features/offer/presentation/widgets/offer_banner_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/offer_page_shimmer.dart';

class OfferPage extends ConsumerWidget {
  const OfferPage({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = AppTheme.of(context).colors;
    final theme = AppTheme.of(context);
    final constants = AddOfferPageConstants();

    return Scaffold(
      backgroundColor: theme.colors.secondary,
      body: switch (ref.watch(getAllOffersProvider)) {
        AsyncData(:final value) => SizedBox(
            child: OfferBannerWidget(
              entity: value,
            ),
          ),
        AsyncError() => const Center(
            child: Text('Error while getting data'),
          ),
        _ => const Center(
            child: OfferPageShimmer(),
          )
      },
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              backgroundColor: color.primary),
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
              Text(constants.txtAppbarTitle,
                  style: theme.typography.h300.copyWith(
                    color: color.secondary,
                  ))
            ],
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
