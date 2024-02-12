import 'package:flutter/material.dart';
import 'package:resto_admin/core/constants/offer_constants/offer_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class OfferBannerWidget extends StatelessWidget {
  final String offerText;
  final ImageProvider offerImage;
  const OfferBannerWidget(
      {super.key, required this.offerText, required this.offerImage});

  @override
  Widget build(BuildContext context) {
    final OfferPageConstants constants = OfferPageConstants();
    final color = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
          child: Container(
            height: MediaQuery.sizeOf(context).height / 4.7,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: color.secondary,
                boxShadow: [BoxShadow(blurRadius: 4, color: color.textSubtle)]),
            child: Padding(
              padding: EdgeInsets.only(
                  left: spaces.space_200,
                  top: spaces.space_200,
                  right: spaces.space_200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height / 7,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: offerImage, fit: BoxFit.fill),
                        color: color.textSubtle,
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: spaces.space_100, top: spaces.space_100),
                    child: Text(
                      offerText,
                      style: TextStyle(
                          fontSize: spaces.space_200,
                          fontFamily: constants.interFont,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: spaces.space_400,
        ),
      ],
    );
  }
}
