import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

import 'package:resto_admin/features/offer/presentation/provider/selected_items_provider.dart';
import 'package:resto_admin/features/offer/presentation/widgets/textfield_widget.dart';

class ListViewProductsWidget extends ConsumerWidget {
  final int itemCount;
  final String product;
  final String oldPrice;
  final String newPrice;
  const ListViewProductsWidget(
      {super.key,
      required this.itemCount,
      required this.product,
      required this.newPrice,
      required this.oldPrice});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentDollarValue = ref.watch(resultProvider);
    final data = ref.watch(selectedItemsProvider).selectedItems;
    final theme = AppTheme.of(context);
    AppAssetsConstants iconConst = AppAssetsConstants();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        log(data.toString());
        return Padding(
          padding: EdgeInsets.only(left: theme.spaces.space_100),
          child: SizedBox(
            height: theme.spaces.space_500,
            child: ListTile(
              leading: Text(
                // snapshot.data![index].name,.
                "",
                style: theme.typography.h500,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    oldPrice,
                    style: theme.typography.h200
                        .copyWith(decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(
                    width: theme.spaces.space_100,
                  ),
                  Text(
                    '$currentDollarValue',
                    style: theme.typography.h600,
                  ),
                  SizedBox(
                    width: theme.spaces.space_100,
                  ),
                  //
                  GestureDetector(
                    onTap: () {
                      ref.read(selectedItemsProvider.notifier).remove(index);
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
  }
}
