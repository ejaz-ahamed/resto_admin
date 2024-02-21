import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/constants/offer_constants/selecting_product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_8_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/gridview_offerpage_widget.dart';

class OfferSelectingPage extends ConsumerWidget {
  static const routePath = '/select';
  const OfferSelectingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    final constants = SelectingProductPageConstants();
    return Scaffold(
      backgroundColor: apptheme.colors.secondary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(apptheme.spaces.space_700),
          child: AppBarWidget(
            title: constants.txtAppbarTitle,
            actionButtonName: constants.txtSelectAllText,
            onPressed: () {},
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: apptheme.spaces.space_300),
          child: Column(
            children: [
              SizedBox(
                height: apptheme.spaces.space_400,
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
              const SizedBox8Widget(),
              // SizedBox(
              //     height: MediaQuery.sizeOf(context).height /
              //         apptheme.spaces.space_125,
              //     width: MediaQuery.sizeOf(context).width,
              //     child: ListViewSeparatedWidget(
              //       text: constants.txtListtext,
              //     )),
              const SizedBox(
                  child: Stack(children: [
                GridViewOfferPageWidget(),
              ]))
            ],
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButtonWidget(
        text: constants.txtSave,
        onPressed: () {},
      ),
    );
  }
}
