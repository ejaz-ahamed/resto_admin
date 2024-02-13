import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class OrderviewPageAppBarWidget extends ConsumerWidget {
  const OrderviewPageAppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(orderpageConstantsProvider);
    final appTheme = AppTheme.of(context);
    return AppBar(
      backgroundColor: appTheme.colors.secondary,
      titleSpacing: appTheme.spaces.space_300,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  constants.backArrow,
                  height: appTheme.spaces.space_200,
                ),
              ),
              SizedBox(
                width: appTheme.spaces.space_200,
              ),
              Text(
                constants.orderDetails,
                style: appTheme.typography.h700,
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  constants.print,
                  style: appTheme.typography.h300.copyWith(
                    color: appTheme.colors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
