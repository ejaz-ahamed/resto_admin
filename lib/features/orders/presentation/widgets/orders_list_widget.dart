import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/presentation/pages/orderview_page.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key});

  @override
  Widget build(BuildContext context) {
    final space = AppTheme.of(context).spaces;
    final color = AppTheme.of(context).colors;
    final typography = AppTheme.of(context).typography;
    final appTheme = AppTheme.of(context);
    AppAssetsConstants iconsConst = AppAssetsConstants();
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .7,
      width: MediaQuery.sizeOf(context).width,
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(
          height: space.space_200,
        ),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context.push(OrderViewPage.routePath);
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
                  child: Container(
                    width: space.space_700,
                    height: space.space_700,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        space.space_500,
                      ),
                      border: Border.all(color: color.textSubtle),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: space.space_400,
                          width: space.space_400,
                          child: SvgPicture.asset(
                            iconsConst.icUser,
                            colorFilter: ColorFilter.mode(
                                appTheme.colors.text, BlendMode.srcATop),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '#12345',
                      style: typography.h500,
                    ),
                    Text(
                      'Palazhi,1111',
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
