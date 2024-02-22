import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class LoadingProductWidget extends StatelessWidget {
  const LoadingProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return GridView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: 4,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: theme.spaces.space_250,
          mainAxisSpacing: theme.spaces.space_250,
          mainAxisExtent: theme.spaces.space_900 * 2.75),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_75),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: theme.colors.secondary,
                  borderRadius: BorderRadius.circular(theme.spaces.space_100),
                  boxShadow: [
                    theme.boxShadow.primary,
                  ],
                ),
                child: SizedBox(
                  width: theme.spaces.space_500 * 3.7,
                  height: theme.spaces.space_500 * 3.7,
                  child: Shimmer.fromColors(
                    baseColor: theme.colors.textInverse,
                    highlightColor: theme.colors.textSubtle,
                    child: Container(
                      width: theme.spaces.space_500 * 3.7,
                      height: theme.spaces.space_500 * 3.7,
                      decoration: BoxDecoration(
                        color: theme.colors.textInverse,
                        borderRadius: BorderRadius.circular(
                          theme.spaces.space_100,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: theme.spaces.space_75,
              ),
              SizedBox(
                width: theme.spaces.space_500 * 3.7,
                height: theme.spaces.space_150,
                child: Shimmer.fromColors(
                  baseColor: theme.colors.textInverse,
                  highlightColor: theme.colors.textSubtle,
                  child: Container(
                    decoration: BoxDecoration(
                        color: theme.colors.primary,
                        borderRadius:
                            BorderRadius.circular(theme.spaces.space_50)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
