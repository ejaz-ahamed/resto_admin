import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/constants/offer_constants/selecting_product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/listview_separated_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_8_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/gridview_offerpage_widget.dart';

class OfferSelectingPage extends ConsumerWidget {
  static const routePath = '/select';
  const OfferSelectingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    final constants = SelectingProductPageConstants();
    final iconConst = AppAssetsConstants();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: apptheme.colors.secondary,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Row(
            children: [
              InkWell(
                onTap: () => context.pop(),
                child: SvgPicture.asset(
                  iconConst.icArrowBackward,
                  height: apptheme.spaces.space_200,
                ),
              ),
              SizedBox(
                width: apptheme.spaces.space_200,
              ),
              Text(
                constants.txtAppbarTitle,
                style: apptheme.typography.h600,
              )
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  constants.txtSelectAllText,
                  style: apptheme.typography.h300.copyWith(
                    color: apptheme.colors.primary,
                  ),
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                height: apptheme.spaces.space_400,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        constants.txtTitleCategories,
                        style: apptheme.typography.h500
                            .copyWith(color: apptheme.colors.text),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox8Widget(),
              SizedBox(
                  height: MediaQuery.sizeOf(context).height / 10,
                  width: MediaQuery.sizeOf(context).width,
                  child: ListViewSeparatedWidget(
                    text: constants.txtListtext,
                  )),
              const SizedBox(
                  child: Stack(children: [
                GridViewOfferPageWidget(),
              ]))
            ],
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButtonWidget(text: "Save", onPressed: () {}),
    );
  }
}
