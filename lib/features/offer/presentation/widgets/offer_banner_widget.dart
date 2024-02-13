import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class OfferBannerWidget extends StatelessWidget {
  final String offerText;
  final ImageProvider offerImage;
  const OfferBannerWidget(
      {super.key, required this.offerText, required this.offerImage});

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
              child: Container(
                height: spaces.space_500 * 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(spaces.space_50),
                    color: color.secondary,
                    boxShadow: [AppTheme.of(context).boxShadow.primary]),
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
                        height: spaces.space_250 * 7,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: offerImage, fit: BoxFit.fill),
                            color: color.textSubtle,
                            borderRadius:
                                BorderRadius.circular(spaces.space_50)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: spaces.space_100, top: spaces.space_100),
                        child: Text(
                          offerText,
                          style: AppTheme.of(context).typography.h500,
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
      },
    );
  }
}
