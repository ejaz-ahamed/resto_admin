import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class OfferPageShimmer extends StatelessWidget {
  const OfferPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: spaces.space_300,
              ),
              child: Container(
                height: AppTheme.of(context).spaces.space_500 * 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    spaces.space_50,
                  ),
                  color: color.secondary,
                  boxShadow: [AppTheme.of(context).boxShadow.secondary],
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: spaces.space_200,
                      top: spaces.space_200,
                      right: spaces.space_200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Shimmer.fromColors(
                        baseColor: color.textInverse,
                        highlightColor: color.textSubtle,
                        child: Container(
                          height: spaces.space_500 * 6,
                          decoration: BoxDecoration(
                            color: color.textSubtle,
                            borderRadius: BorderRadius.circular(
                              spaces.space_100,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: spaces.space_100,
                          top: spaces.space_100,
                        ),
                        child: Shimmer.fromColors(
                          baseColor: color.textInverse,
                          highlightColor: color.textSubtle,
                          child: Container(
                            height: spaces.space_200,
                            width: spaces.space_500 * 4,
                            decoration: BoxDecoration(
                                color: color.textInverse,
                                borderRadius:
                                    BorderRadius.circular(spaces.space_100)),
                          ),
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
