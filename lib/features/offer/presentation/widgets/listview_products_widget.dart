import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/enums/offer_type.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/offer/presentation/provider/offer_provider.dart';
import 'package:resto_admin/features/offer/presentation/provider/selected_items_provider.dart';

class ListViewProductsWidget extends ConsumerWidget {
  final OfferType offerType;
  final double offerValue;

  const ListViewProductsWidget({
    super.key,
    required this.offerValue,
    required this.offerType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);

    AppAssetsConstants iconConst = AppAssetsConstants();

    return FutureBuilder(
      future: ref.read(offerProvider.notifier).getSelectedProducts(
            ref.watch(selectedItemsProvider).selectedItems,
          ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final productData = snapshot.data![index];

              /// The current price is taken as the maximum price of all
              /// types in the current product
              var currentPrice = double.parse(productData.types.first.price);
              for (final type in productData.types) {
                currentPrice = max(currentPrice, double.parse(type.price));
              }

              /// The price after adding the offer
              final double offerPrice;
              if (offerType == OfferType.amount) {
                offerPrice = max(0.0, currentPrice - offerValue);
              } else {
                offerPrice = currentPrice - (currentPrice * (offerValue / 100));
              }

              return Padding(
                padding: EdgeInsets.only(left: theme.spaces.space_100),
                child: SizedBox(
                  height: theme.spaces.space_500,
                  child: ListTile(
                    leading: Text(
                      productData.name,
                      style: theme.typography.h500,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '$currentPrice',
                          style: theme.typography.h200
                              .copyWith(decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(
                          width: theme.spaces.space_100,
                        ),
                        Text(
                          '$offerPrice',
                          style: theme.typography.h600,
                        ),
                        SizedBox(
                          width: theme.spaces.space_100,
                        ),
                        //
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(selectedItemsProvider.notifier)
                                .remove(index);
                          },
                          child: SvgPicture.asset(
                            iconConst.icRemove,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
