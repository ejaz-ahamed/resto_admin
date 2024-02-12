import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 8),
          child: ListTile(
            leading: Text(
              'Hot and sour soup',
              style: theme.typography.h400.copyWith(fontFamily: 'Inter'),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '\$33',
                  style: theme.typography.h400,
                ),
                Text('\$30'),
                SvgPicture.asset(
                  'assets/icons/ic_remove.svg',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
