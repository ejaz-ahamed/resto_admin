import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/presentation/pages/orderview_page.dart';

class OrderListView extends ConsumerWidget {
  final List<OrderEntity> entity;
  const OrderListView({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final space = AppTheme.of(context).spaces;
    final color = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;

    AppAssetsConstants iconsConst = AppAssetsConstants();

    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .7,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.separated(
        itemCount: entity.length,
        separatorBuilder: (context, index) => SizedBox(
          height: space.space_200,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context.push(OrderViewPage.routePath, extra: (entity[index]));
          },
          child: Container(
            height: space.space_100 * 11,
            decoration: BoxDecoration(
              border: Border.all(
                width: space.space_25 / 2,
                color: color.textInverse,
              ),
              borderRadius: BorderRadius.circular(
                space.space_100,
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: space.space_200),
                  child: entity[index].user.imgPath.trim().isNotEmpty
                      ? CircleAvatar(
                          backgroundImage:
                              NetworkImage(entity[index].user.imgPath),
                          radius: space.space_100 * 3.5,
                        )
                      : Container(
                          width: space.space_700,
                          height: space.space_700,
                          padding: EdgeInsets.all(space.space_200),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              space.space_500,
                            ),
                            border: Border.all(color: color.textSubtle),
                          ),
                          child: SvgPicture.asset(
                            iconsConst.icUser,
                            colorFilter:
                                ColorFilter.mode(color.text, BlendMode.srcATop),
                          ),
                        ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      entity[index].id,
                      style: typography.h500,
                    ),
                    Text(
                      entity[index].location,
                      style: typography.h100,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
