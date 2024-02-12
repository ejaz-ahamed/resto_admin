import 'package:flutter/material.dart';
import 'package:resto_admin/core/constants/offer_constants/add_offer_page_constants.dart';
import 'package:resto_admin/core/constants/offer_constants/offer_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class TabButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color fillColor;
  final Color textColor;
  final Color borderColor;
  final void Function()? onPressed;

  const TabButtonWidget(
      {super.key,
      required this.buttonText,
      required this.textColor,
      required this.onPressed,
      required this.borderColor,
      required this.fillColor});

  @override
  Widget build(BuildContext context) {
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    AddOfferPageConstants constants = AddOfferPageConstants();
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 4.1,
      height: MediaQuery.sizeOf(context).height / 22,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
              color: fillColor,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(spaces.space_100)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonText,
                style: typography.h400.copyWith(
                    color: textColor, fontFamily: constants.interFont),
                    
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
