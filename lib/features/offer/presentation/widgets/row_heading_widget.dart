import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/offer_constants/add_offer_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/text_button_widget.dart';
import 'package:resto_admin/features/offer/presentation/pages/offer_selecting_product_page.dart';

class RowHeadingWidget extends ConsumerWidget {
  const RowHeadingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AddOfferPageConstants constants = AddOfferPageConstants();
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppTheme.of(context).spaces.space_300),
      child: Row(
        children: [
          Text(
            constants.txtProduct,
            style: AppTheme.of(context).typography.h600,
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
    );
  }
}
