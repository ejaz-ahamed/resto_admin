import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

import 'package:resto_admin/features/products/presentation/pages/overview_items_page.dart';
import 'package:resto_admin/features/products/presentation/providers/category_provider.dart';
import 'package:resto_admin/features/products/presentation/providers/product_provider.dart';

class GridViewWidget extends ConsumerWidget {
  const GridViewWidget({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return StreamBuilder(
      stream: ref
          .read(productProvider.notifier)
          .getAll(ref.watch(categoryProvider).selectedCategory),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: snapshot.data!.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: theme.spaces.space_250,
                mainAxisSpacing: theme.spaces.space_250,
                mainAxisExtent: theme.spaces.space_900 * 2.75),
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                color: theme.colors.secondary,
                borderRadius: BorderRadius.circular(theme.spaces.space_100),
                boxShadow: [
                  theme.boxShadow.primary,
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: theme.spaces.space_150),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        context.push(OverViewItemsPage.routePath,
                            extra: snapshot.data![index]);
                      },
                      child: Container(
                        width: theme.spaces.space_500 * 3.7,
                        height: theme.spaces.space_500 * 3.7,
                        decoration: BoxDecoration(
                          color: theme.colors.textInverse,
                          image: DecorationImage(
                            image: NetworkImage(
                              snapshot.data![index].imagePath,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: theme.spaces.space_50,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: theme.spaces.space_150),
                          child: Text(snapshot.data![index].name),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
