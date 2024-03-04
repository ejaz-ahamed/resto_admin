import 'package:flutter/cupertino.dart';
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
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: theme.spaces.space_100,
              vertical: theme.spaces.space_200),
          child: Container(
            height: theme.spaces.space_600 * 4,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: theme.spaces.space_50,
                    color: theme.colors.textSubtle)
              ],
              borderRadius: BorderRadius.circular(theme.spaces.space_200),
              color: theme.colors.secondary,
            ),
            child: Row(
              children: [
                Container(
                  height: theme.spaces.space_600 * 4,
                  width: theme.spaces.space_700,
                  decoration: BoxDecoration(
                      color: theme.colors.textSubtlest,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(theme.spaces.space_200),
                          bottomLeft: Radius.circular(theme.spaces.space_200))),
                  child: Center(
                      child: RotatedBox(
                          quarterTurns: 3,
                          child: Text(
                            '50% OFF',
                            style: theme.typography.h800
                                .copyWith(color: theme.colors.secondary),
                          ))),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: theme.spaces.space_200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.60,
                        child: Text(
                          'Gold Offer on 5 - 10 cashback using amazon pay balance',
                          style: theme.typography.h300,
                        ),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
