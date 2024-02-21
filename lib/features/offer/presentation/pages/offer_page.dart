import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/offer_constants/offer_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/features/offer/presentation/pages/add_offer_page.dart';
import 'package:resto_admin/features/offer/presentation/provider/offer_provider.dart';
import 'package:resto_admin/features/offer/presentation/widgets/offer_banner_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/offer_page_shimmer.dart';

class OfferPage extends ConsumerWidget {
  const OfferPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spaces = AppTheme.of(context).spaces;
    final theme = AppTheme.of(context);
    final OfferPageConstants constants = OfferPageConstants();
    return Scaffold(
      backgroundColor: theme.colors.secondary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(theme.spaces.space_700),
        child: AppBarWidget(
          title: constants.txtAppbarTitle,
          actionButtonName: constants.txtAddOfferText,
          onPressed: () => context.push(AddOfferPage.routePath),
        ),
      ),
      body: switch (ref.watch(getAllOffersProvider)) {
        AsyncData(:final value) => Padding(
            padding: EdgeInsets.only(top: spaces.space_400),
            child: SizedBox(
              child: OfferBannerWidget(
                entity: value,
              ),
            ),
          ),
        AsyncError() => const Center(
            child: Text('Error while getting data'),
          ),
        _ => const Center(
            child: OfferPageShimmer(),
          )
      },
    );
  }
}
