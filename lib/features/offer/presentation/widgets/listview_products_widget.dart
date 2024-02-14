import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class ListViewProductsWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    AppAssetsConstants iconConst = AppAssetsConstants();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding:  EdgeInsets.only(left: theme.spaces.space_100),
          child: SizedBox(
            height: theme.spaces.space_500,
            child: ListTile(
              leading: Text(
                product,
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
                    newPrice,
                    style: theme.typography.h600,
                  ),
                  SizedBox(
                    width: theme.spaces.space_100,
                  ),
                  SvgPicture.asset(
                    iconConst.icRemove,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
