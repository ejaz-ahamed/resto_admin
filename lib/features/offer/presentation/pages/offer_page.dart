import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/offer/presentation/provider/offer_provider.dart';
import 'package:resto_admin/features/offer/presentation/widgets/offer_banner_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/offer_page_shimmer.dart';

class OfferPage extends ConsumerWidget {
  const OfferPage({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);

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
      
    );
  }
}
