import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/category_Grid_widget.dart';

class ManageCategoriesPage extends HookConsumerWidget {
  static const routePath = '/manageCotegory';
  const ManageCategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);
    final selectedItems = useState<Set<int>>({});
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.colors.secondary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(theme.spaces.space_700),
          child: AppBarWidget(
            title: data.txtManageCategories,
            actionButtonName: data.txtSelectAll,
            onPressed: () {
              selectedItems.value = Set.from(Iterable.generate(7, (i) => i));
            },
          )),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(theme.spaces.space_300),
              child: SizedBox(
                  height: theme.spaces.space_100 * 68.75,
                  width: theme.spaces.space_100 * 47.5,
                  child: CategoryGridWidget(selectedItems: selectedItems)),
            ),
          ),
          ElevatedButtonWidget(text: data.txtDelete, onPressed: () {})
        ],
      ),
    );
  }
}
