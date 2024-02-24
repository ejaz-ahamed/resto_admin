import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class LoadingOrderWidget extends StatelessWidget {
  const LoadingOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;

    return Column(
      children: [
        SizedBox(
          height: space.space_600,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context, index) => Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: space.space_100),
                  child: Container(
                    height: space.space_100 * 5,
                    width: space.space_600 * 3,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: space.space_25 / 2,
                        color: colors.textInverse,
                      ),
                      borderRadius: BorderRadius.circular(
                        space.space_100,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                                baseColor: colors.textInverse,
                                highlightColor: colors.textSubtle,
                                child: Container(
                                  width: space.space_400 * 3,
                                  height: space.space_150,
                                  decoration: BoxDecoration(
                                      color: colors.primary,
                                      borderRadius: BorderRadius.circular(
                                          space.space_50)),
                                )),
                            SizedBox(
                              height: space.space_100,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: space.space_200,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .7,
          child: ListView.builder(
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (context, index) => Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: space.space_100),
                  child: Container(
                      height: space.space_100 * 11,
                      width: space.space_600 * 7.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: space.space_25 / 2,
                          color: colors.textInverse,
                        ),
                        borderRadius: BorderRadius.circular(
                          space.space_100,
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: space.space_200),
                            child: Shimmer.fromColors(
                              baseColor: colors.textInverse,
                              highlightColor: colors.textSubtle,
                              child: CircleAvatar(
                                radius: space.space_100 * 3.5,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Shimmer.fromColors(
                                  baseColor: colors.textInverse,
                                  highlightColor: colors.textSubtle,
                                  child: Container(
                                    width: space.space_400 * 3,
                                    height: space.space_150,
                                    decoration: BoxDecoration(
                                        color: colors.primary,
                                        borderRadius: BorderRadius.circular(
                                            space.space_50)),
                                  )),
                              SizedBox(
                                height: space.space_100,
                              ),
                              Shimmer.fromColors(
                                  baseColor: colors.textInverse,
                                  highlightColor: colors.textSubtle,
                                  child: Container(
                                    width: space.space_400 * 5,
                                    height: space.space_150,
                                    decoration: BoxDecoration(
                                        color: colors.primary,
                                        borderRadius: BorderRadius.circular(
                                            space.space_50)),
                                  )),
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
