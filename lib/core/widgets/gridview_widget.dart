import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/products/presentation/pages/overview_items_page.dart';

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
          mainAxisExtent: theme.spaces.space_900 * 2.75),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(theme.spaces.space_100),
          boxShadow: [
            BoxShadow(
              blurRadius: 34,
              spreadRadius: -10,
              color: Colors.black.withOpacity(0.1),
            )
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: theme.spaces.space_150),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  context.push(OverViewItemsPage.routePath);
                },
                child: Container(
                  width: theme.spaces.space_500 * 3.7,
                  height: theme.spaces.space_500 * 3.7,
                  decoration: BoxDecoration(
                    color: theme.colors.textInverse,
                  ),
                ),
              ),
              SizedBox(
                height: theme.spaces.space_50,
              ),
              const Text("data"),
            ],
          ),
        ),
      ),
    );
  }
}
