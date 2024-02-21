import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:resto_admin/core/constants/offer_constants/selecting_product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/listview_separated_widget.dart';

import 'package:resto_admin/core/widgets/sized_box_8_widget.dart';
import 'package:resto_admin/features/offer/presentation/pages/edit_offer_page.dart';
import 'package:resto_admin/features/offer/presentation/provider/selected_items_provider.dart';

import 'package:resto_admin/features/offer/presentation/widgets/gridview_offerpage_widget.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/presentation/providers/category_provider.dart';
import 'package:resto_admin/features/products/presentation/providers/product_provider.dart';

class OfferSelectingPage extends HookConsumerWidget {
  static const routePath = '/select';
  final List<ProductEntity> entity;
  const OfferSelectingPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final constants = SelectingProductPageConstants();
    final selectedItems = useState<Set<String>>({});

    final itemCount = 0;

    void selectall() {
      if (selectedItems.value.length < itemCount) {
        // selectedItems.value = ref
        //     .read(getAllProductsByCategoryProvider.call(entity[itemCount].id))
        //     .asData!
        //     .value
        //     .map((e) => e.id)
        //     .toSet();
      } else {
        selectedItems.value = {};
      }
    }

    final searchController = useTextEditingController();

    return Scaffold(
      backgroundColor: theme.colors.secondary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(theme.spaces.space_700),
        child: AppBarWidget(
          title: constants.txtAppbarTitle,
          actionButtonName: selectedItems.value.length < itemCount
              ? constants.txtSelectAllText
              : constants.txtUnSelect,
          onPressed: () {
            selectall();
          },
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
                    AsyncData(:final value) => ListViewSeparatedWidget(
                        clearController: searchController,
                        entity: value,
                      ),
                    AsyncError() => const Center(
                        child: Text('Error while getting data'),
                      ),
                    _ => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  }),
              SizedBox(
                  child: Stack(children: [
                GridViewOfferPageWidget(selectedItems: selectedItems),
              ]))
            ],
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButtonWidget(
        text: constants.txtSave,
        onPressed: () {
          // onSavePressed();
          ref
              .read(selectedItemsProvider.notifier)
              .updateSelectedItems(selectedItems.value);
          context.pop(
            EditOfferPage.routePath,
          );
        },
      ),
    );
  }
}
//  text: constants.txtListtext
