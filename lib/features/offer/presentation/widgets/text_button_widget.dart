import 'package:flutter/material.dart';
import 'package:resto_admin/core/constants/offer_constants/offer_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class TextButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color color;

  const TextButtonWidget(
      {super.key, required this.buttonText, required this.color});

  @override
  Widget build(BuildContext context) {
    OfferPageConstants constants = OfferPageConstants();
    return InkWell(
      onTap: () {},
      child: Text(
        buttonText,
        style: TextStyle(
          color: color,
          fontFamily: constants.interFont,
          fontWeight: FontWeight.w500,
          fontSize: AppTheme.of(context).spaces.space_25 * 7,
        ),
      ),
    );
  }
}
