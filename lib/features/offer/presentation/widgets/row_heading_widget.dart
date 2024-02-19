import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/offer_constants/add_offer_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/text_button_widget.dart';
import 'package:resto_admin/features/offer/presentation/pages/edit_offer_page.dart';
import 'package:resto_admin/features/offer/presentation/pages/offer_selecting_product_page.dart';
import 'package:resto_admin/features/offer/presentation/widgets/listview_products_widget.dart';

class RowHeadingWidget extends ConsumerWidget {
  const RowHeadingWidget({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentDollarValue = ref.watch(currentStateProvider);
    AddOfferPageConstants constants = AddOfferPageConstants();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppTheme.of(context).spaces.space_300),
          child: Row(
            children: [
              Text(
                constants.txtProduct,
                style: AppTheme.of(context).typography.h700,
              ),
              const Spacer(),
              TextButtonWidget(
                  onTap: () {
                    context.push(
                      OfferSelectingPage.routePath,
                    );
                  },
                  buttonText: constants.txtAdd,
                  color: AppTheme.of(context).colors.primary)
            ],
          ),
        ),
        const ListViewProductsWidget(
            itemCount: 10, product: 'mango', newPrice: '0', oldPrice: '20')
      ],
    );
  }
}
