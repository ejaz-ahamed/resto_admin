import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/product_loading_widget.dart';
import 'package:resto_admin/core/widgets/rounded_check_box_widget.dart';

import 'package:resto_admin/features/products/presentation/providers/category_provider.dart';
import 'package:resto_admin/features/products/presentation/providers/product_provider.dart';

class GridViewOfferPageWidget extends HookConsumerWidget {
  final ValueNotifier<Set<String>> selectedItems;

  const GridViewOfferPageWidget({super.key, required this.selectedItems});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final selectedItems = useState<Set<int>>({});

    final selectedCategory =
        ref.watch(categoryProvider.select((value) => value.selectedCategory));
    final theme = AppTheme.of(context);
    return ref.watch(getAllProductsByCategoryProvider(selectedCategory)).when(
        data: (data) {
          final products = ref.watch(productProvider).searchedProducts ?? data;
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
                  boxShadow: [theme.boxShadow.primary],
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: theme.spaces.space_150),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: theme.spaces.space_500 * 3.7,
                            height: theme.spaces.space_500 * 3.7,
                            decoration: BoxDecoration(
                              color: theme.colors.textInverse,
                            ),
                            child: Image.network(
                              productData.imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              top: theme.spaces.space_100,
                              right: theme.spaces.space_100,
                              child: RoundedCheckboxWidget(
                                isChecked: selectedItems.value
                                    .contains(productData.id),
                                onTap: () {
                                  if (selectedItems.value
                                      .contains(productData.id)) {
                                    selectedItems.value = {
                                      ...selectedItems.value
                                    }..remove(productData.id);
                                  } else {
                                    selectedItems.value = {
                                      ...selectedItems.value,
                                      productData.id
                                    };
                                  }
                                },
                              ))
                        ],
                      ),
                      SizedBox(
                        height: theme.spaces.space_50,
                      ),
                      Text(productData.name),
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
              child: LoadingProductWidget(),
            ));
  }
}
