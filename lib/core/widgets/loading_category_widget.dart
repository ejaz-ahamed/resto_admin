import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class LoadingCategoryWidget extends StatelessWidget {
  const LoadingCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_75),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: theme.spaces.space_500,
                height: theme.spaces.space_600,
                child: Shimmer.fromColors(
                  baseColor: theme.colors.textInverse,
                  highlightColor: theme.colors.textSubtle,
                  child: const CircleAvatar(),
                ),
              ),
              SizedBox(
                height: theme.spaces.space_75,
              ),
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: theme.spaces.space_150),
                width: theme.spaces.space_700,
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
