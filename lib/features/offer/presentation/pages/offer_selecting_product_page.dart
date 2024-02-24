import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/offer_constants/selecting_product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/category_listview_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/loading_category_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_8_widget.dart';
import 'package:resto_admin/features/offer/presentation/pages/edit_offer_page.dart';
import 'package:resto_admin/features/offer/presentation/provider/selected_items_provider.dart';
import 'package:resto_admin/features/offer/presentation/widgets/gridview_offerpage_widget.dart';
import 'package:resto_admin/features/products/presentation/providers/category_provider.dart';
import 'package:resto_admin/features/products/presentation/providers/product_provider.dart';

class OfferSelectingPage extends HookConsumerWidget {
  static const routePath = '/select';

  const OfferSelectingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final constants = ref.watch(selectingProductPageConstantsProvider);
    final selectedItems = useState<Set<String>>({});

    final productsData = ref
        .watch(getAllProductsByCategoryProvider(ref
            .watch(categoryProvider.select((value) => value.selectedCategory))))
        .asData;

    /// The IDs of the currently selected category products
    final currentCategoryProductIds = productsData != null
        ? productsData.value.map((e) => e.id).toList()
        : <String>[];

    /// Once the product data is loaded, this count will have a positive value
    /// So that when this count is negative, we have to hide the selection UI
    /// (e.g: Select All button)
    final itemCount = productsData == null ? -1 : productsData.value.length;

    /// Action button title to show for the select all and unselect all buttons in the app bar
    final String appBarActionTitle;
    if (itemCount <= 0) {
      /// Page not loaded completely
      appBarActionTitle = '';
    } else if (selectedItems.value
            .where((product) => currentCategoryProductIds.contains(product))
            .length <
        itemCount) {
      /// Currently all items are not selected
      appBarActionTitle = constants.txtSelectAllText;
    } else {
      /// All items are already selected
      appBarActionTitle = constants.txtUnSelect;
    }

    /// Select all the products
    /// If all of them are already selected then un select all of them
    void selectOrUnselectAll() {
      if (itemCount < 0) {
        /// Do nothing if the page content is not loaded properly
        return;
      }

      if (selectedItems.value
              .where((product) => currentCategoryProductIds.contains(product))
              .length <
          itemCount) {
        /// Need to select all products from the current category
        selectedItems.value = {...selectedItems.value}
          ..addAll(currentCategoryProductIds);
      } else {
        /// Need to remove all products from the current category
        selectedItems.value = {...selectedItems.value}
          ..removeAll(currentCategoryProductIds);
      }
    }

    /// Pass the products saved from the select page to the
    /// edit offer page
    void passSelectedProducts() {
      ref
          .read(selectedItemsProvider.notifier)
          .updateSelectedItems(selectedItems.value);
      context.pop(
        EditOfferPage.routePath,
      );
    }

    return Scaffold(
      backgroundColor: theme.colors.secondary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(theme.spaces.space_700),
        child: AppBarWidget(
          title: constants.txtAppbarTitle,
          actionButtonName: appBarActionTitle,
          onPressed: () => selectOrUnselectAll(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_300),
          child: Column(
            children: [
              SizedBox(
                height: theme.spaces.space_400,
                child: Row(
                  children: [
                    Text(
                      constants.txtTitleCategories,
                      style: theme.typography.h500
                          .copyWith(color: theme.colors.text),
                    ),
                  ],
                ),
              ),
              const SizedBox8Widget(),
              SizedBox(
                height: theme.spaces.space_100 * 10,
                child: switch (ref.watch(getAllCategoryProvider)) {
                  AsyncData(:final value) => CategoryListViewWidget(
                      entity: value,
                    ),
                  AsyncError() => const Center(
                      child: Text('Error while getting data'),
                    ),
                  _ => const Center(child: LoadingCategoryWidget()),
                },
              ),
              GridViewOfferPageWidget(selectedItems: selectedItems)
            ],
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButtonWidget(
        text: constants.txtSave,
        onPressed: passSelectedProducts,
      ),
    );
  }
}
