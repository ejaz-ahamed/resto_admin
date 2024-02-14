import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/widgets/text_button_widget.dart';

class PreferredAppBarWidget extends ConsumerWidget {
  final String title;

  const PreferredAppBarWidget({super.key, required this.title});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);
    AppAssetsConstants iconConst = AppAssetsConstants();
    final appTheme = AppTheme.of(context);
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      titleSpacing: appTheme.spaces.space_300,
      title: Row(
        children: [
          InkWell(
            onTap: () => context.pop(),
            child: SvgPicture.asset(
              iconConst.icArrowBackward,
              height: appTheme.spaces.space_200,
            ),
          ),
          SizedBox(
            width: appTheme.spaces.space_200,
          ),
          Text(
            title,
            style:
                appTheme.typography.h600.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: appTheme.spaces.space_300),
          child: TextButtonWidget(
              onTap: () {},
              buttonText: data.txtDelete,
              color: appTheme.colors.primary),
        ),
      ],
    );
  }
}
