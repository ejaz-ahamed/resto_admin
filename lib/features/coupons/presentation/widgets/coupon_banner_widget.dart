import 'package:flutter/material.dart';

import 'package:resto_admin/core/themes/app_theme.dart';

class CouponBannerWidget extends StatelessWidget {
  const CouponBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: AppTheme.of(context).spaces.space_500 * 5,
              decoration: BoxDecoration(
                  color: theme.colors.secondary,
                  boxShadow: [AppTheme.of(context).boxShadow.primary]),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: theme.spaces.space_300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Gold Offer on 5 - 10 cashback using amazon pay balance',
                      style: theme.typography.h300,
                    ),
                    Text(
                      'Applicable on First order',
                      style: theme.typography.h200
                          .copyWith(color: theme.colors.primary),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            )
          ],
        );
      },
    );
  }
}
