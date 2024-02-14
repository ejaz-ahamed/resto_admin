import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class GridViewWidget extends ConsumerWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return GridView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: 5,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: theme.spaces.space_250,
          mainAxisSpacing: theme.spaces.space_250,
          mainAxisExtent: theme.spaces.space_900 * 2.8),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: theme.colors.secondary,
          borderRadius: BorderRadius.circular(theme.spaces.space_100),
          boxShadow: [theme.boxShadow.primary],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: theme.spaces.space_200,
              horizontal: theme.spaces.space_200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: theme.spaces.space_500 * 3.7,
                height: theme.spaces.space_500 * 3.425,
                decoration: BoxDecoration(
                    color: theme.colors.textInverse,
                    borderRadius:
                        BorderRadius.circular(theme.spaces.space_100)),
              ),
              SizedBox(
                height: theme.spaces.space_125,
              ),
              const Text("data"),
            ],
          ),
        ),
      ),
    );
  }
}
