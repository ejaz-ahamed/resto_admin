import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/enums/coupon_type.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/coupons/data/models/condition_model.dart';
import 'package:resto_admin/features/coupons/domain/entities/coupon_entity.dart';
import 'package:resto_admin/features/coupons/presentation/pages/edit_coupon_page.dart';

class CouponBannerWidget extends StatelessWidget {
  final List<CouponEntity> entity;
  const CouponBannerWidget({super.key, required this.entity});
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: entity.length,
      itemBuilder: (context, index) {
        final couponData = entity[index];
        var conditionText = '';

        for (var i = 0; i < couponData.condition.length; i++) {
          final condition = couponData.condition[i];

          if (i > 0) {
            conditionText += switch (condition.logic) {
              ConditionLogic.and => 'and ',
              ConditionLogic.or => 'or ',
            };
          }

          conditionText += switch (condition.count) {
            ConditionType.count => 'Order number ',
            ConditionType.amount => 'Total amount ',
          };

          conditionText += switch (condition.check) {
            ConditionCheck.equalTo => ' is ',
            ConditionCheck.greaterThan => ' is more than ',
            ConditionCheck.lessThan => 'is less than'
          };

          conditionText += condition.value.toStringAsFixed(0);

          if (i != couponData.condition.length - 1) {
            conditionText += '\n';
          }
        }
        var offerText = '';
        if (entity[index].couponType == CouponType.values.byName('amount')) {
          offerText +=
              "SAVE ${entity[index].percentageOrAmount.toStringAsFixed(0)} RS";
        } else if (entity[index].couponType ==
            CouponType.values.byName('percentage')) {
          offerText +=
              "GET ${entity[index].percentageOrAmount.toStringAsFixed(0)}% OFF";
        } else {
          offerText += "FREE DELIVERY";
        }

        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: theme.spaces.space_100,
              vertical: theme.spaces.space_200),
          child: InkWell(
            onTap: () => context.push(EditCouponPage.routePath),
            child: Container(
              height: theme.spaces.space_600 * 4,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: theme.spaces.space_50,
                      color: theme.colors.textInverse)
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
                            bottomLeft:
                                Radius.circular(theme.spaces.space_200))),
                    child: Center(
                        child: RotatedBox(
                            quarterTurns: 3,
                            child: Text(
                              offerText,
                              style: theme.typography.h700
                                  .copyWith(color: theme.colors.secondary),
                            ))),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: theme.spaces.space_200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.60,
                          child: Text(
                            entity[index].title!,
                            style: theme.typography.h300,
                          ),
                        ),
                        Text(
                          conditionText,
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
                            entity[index].code!,
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
          ),
        );
      },
    );
  }
}
