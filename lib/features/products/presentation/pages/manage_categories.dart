import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';

import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';
import 'package:resto_admin/features/products/presentation/providers/category_provider.dart';
import 'package:resto_admin/features/products/presentation/widgets/category_Grid_widget.dart';

class ManageCategoriesPage extends HookConsumerWidget {
  static const routePath = '/manageCotegory';
  final List<CategoryEntity> entity;
  const ManageCategoriesPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);
    final selectedItems = useState<Set<String>>({});

    final itemCount = entity.length;
    final theme = AppTheme.of(context);

    void selectAll() {
      if (selectedItems.value.length < itemCount) {
        selectedItems.value =
            ref.read(categoryProvider).categories.map((e) => e.id).toSet();
      } else {
        selectedItems.value = {};
      }
    }

    return Scaffold(
      backgroundColor: theme.colors.secondary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(theme.spaces.space_700),
          child: AppBarWidget(
            title: data.txtManageCategories,
            actionButtonName: selectedItems.value.length < itemCount
                ? data.txtSelectAll
                : data.txtUnSelectAll,
            onPressed: selectAll,
          )),
      body: Padding(
        padding: EdgeInsets.all(theme.spaces.space_300),
        child: SizedBox(
          width: theme.spaces.space_100 * 47.5,
          child: CategoryGridWidget(
            selectedItems: selectedItems,
            entity: entity,
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButtonWidget(
        text: data.txtDelete,
        onPressed: () {
          ref
              .read(categoryProvider.notifier)
              .deleteMany(docIdsToDelete: selectedItems.value.toList());
          context.pop();
        },
      ),
    );
  }
}
