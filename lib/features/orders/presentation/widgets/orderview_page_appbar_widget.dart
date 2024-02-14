import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class OrderviewPageAppBarWidget extends ConsumerWidget {
  const OrderviewPageAppBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(orderpageConstantsProvider);
    final appTheme = AppTheme.of(context);
    AppAssetsConstants iconsConstats = AppAssetsConstants();
    return AppBar(
      backgroundColor: appTheme.colors.secondary,
      titleSpacing: appTheme.spaces.space_300,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              context.pop();
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  iconsConstats.icArrowBackward,
                  height: appTheme.spaces.space_200,
                  colorFilter:
                      ColorFilter.mode(appTheme.colors.text, BlendMode.srcATop),
                ),
                SizedBox(
                  width: appTheme.spaces.space_200,
                ),
                Text(
                  constants.txtorderDetails,
                  style: appTheme.typography.h700,
                ),
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  constants.txtprint,
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
