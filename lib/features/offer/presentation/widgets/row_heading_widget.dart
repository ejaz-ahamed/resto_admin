import 'package:flutter/material.dart';
import 'package:resto_admin/core/constants/offer_constants/add_offer_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/text_button_widget.dart';

class RowHeadingWidget extends StatelessWidget {
  const RowHeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AddOfferPageConstants constants = AddOfferPageConstants();
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppTheme.of(context).spaces.space_300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            constants.product,
            style: AppTheme.of(context).typography.h700,
          ),
          
          TextButtonWidget(
              onTap: () {},
              buttonText: constants.add,
              color: AppTheme.of(context).colors.primary)
        ],
      ),
    );
  }
}
