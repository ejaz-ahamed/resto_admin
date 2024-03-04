import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            Stack(
              children: [
                Container(
                  height: AppTheme.of(context).spaces.space_500 * 5,
                  decoration: BoxDecoration(
                      color: theme.colors.secondary,
                      borderRadius:
                          BorderRadius.circular(theme.spaces.space_200),
                      boxShadow: [AppTheme.of(context).boxShadow.primary]),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: theme.spaces.space_800,
                        right: theme.spaces.space_200),
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
                          style: theme.typography.h300
                              .copyWith(color: theme.colors.primary),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: theme.spaces.space_25,
                              horizontal: theme.spaces.space_150),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(theme.spaces.space_100),
                            color: theme.colors.textSubtlest,
                          ),
                          child: Text(
                            'CODE25',
                            style: theme.typography.h400
                                .copyWith(color: theme.colors.secondary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: AppTheme.of(context).spaces.space_500 * 5,
                  width: 50,
                  decoration: BoxDecoration(
                      color: AppTheme.of(context).colors.textSubtle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(theme.spaces.space_200),
                          bottomLeft: Radius.circular(theme.spaces.space_200))),
                )
              ],
            ),
            SizedBox(
              height: theme.spaces.space_300,
            )
          ],
        );
      },
    );
  }
}
