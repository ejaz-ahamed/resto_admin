import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    final spaces = AppTheme.of(context).spaces;
    final theme = AppTheme.of(context);

    return Scaffold(
      backgroundColor: theme.colors.secondary,
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
      floatingActionButton: FloatingActionButton.small(
          backgroundColor: color.primary,
          onPressed: () {
            ref.read(imageProvider.notifier).state = null;
            context.push(AddOfferPage.routePath);
          },
          child: Icon(
            Icons.add,
            color: color.secondary,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
