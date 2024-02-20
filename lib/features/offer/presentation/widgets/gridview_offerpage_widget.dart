import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/rounded_check_box_widget.dart';
import 'package:resto_admin/features/offer/presentation/pages/offer_selecting_product_page.dart';
import 'package:resto_admin/features/products/presentation/providers/product_provider.dart';

class GridViewOfferPageWidget extends HookConsumerWidget {
  final ValueNotifier<Set<int>> selectedItems;
  const GridViewOfferPageWidget({super.key, required this.selectedItems});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final selectedItems = useState<Set<int>>({});
    final theme = AppTheme.of(context);
    return StreamBuilder(
        stream: ref.read(productProvider.notifier).getAll(),
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
                              snapshot.data![index].imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                              top: theme.spaces.space_100,
                              right: theme.spaces.space_100,
                              child: RoundedCheckboxWidget(
                                isChecked: selectedItems.value.contains(index),
                                onTap: () {
                                  if (selectedItems.value.contains(index)) {
                                    selectedItems.value = {
                                      ...selectedItems.value
                                    }..remove(index);
                                  } else {
                                    selectedItems.value = {
                                      ...selectedItems.value,
                                      index
                                    };
                                  }
                                },
                              ))
                        ],
                      ),
                      SizedBox(
                        height: theme.spaces.space_50,
                      ),
                      Text(snapshot.data![index].name),
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
        });
  }
}
