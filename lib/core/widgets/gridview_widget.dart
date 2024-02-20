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
    final selectedCategory =
        ref.watch(categoryProvider.select((value) => value.selectedCategory));

    return ref.watch(getAllProductsByCategoryProvider(selectedCategory)).when(
          data: (data) {
            final products =
                ref.watch(productProvider).searchedProducts ?? data;

            return GridView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: products.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: theme.spaces.space_250,
                  mainAxisSpacing: theme.spaces.space_250,
                  mainAxisExtent: theme.spaces.space_900 * 2.75),
              itemBuilder: (context, index) {
                final productData = products[index];

                return Container(
                  decoration: BoxDecoration(
                    color: theme.colors.secondary,
                    borderRadius: BorderRadius.circular(theme.spaces.space_100),
                    boxShadow: [
                      theme.boxShadow.primary,
                    ],
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: theme.spaces.space_150),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            context.push(OverViewItemsPage.routePath,
                                extra: productData);
                          },
                          child: Container(
                            width: theme.spaces.space_500 * 3.7,
                            height: theme.spaces.space_500 * 3.7,
                            decoration: BoxDecoration(
                              color: theme.colors.textInverse,
                              image: DecorationImage(
                                image: NetworkImage(
                                  productData.imagePath,
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
                              child: Text(productData.name),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => const Center(
            child: Text("Error!!!, please retry"),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
