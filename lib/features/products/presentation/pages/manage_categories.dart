import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/category_Grid_widget.dart';

class ManageCategoriesPage extends HookConsumerWidget {
  const ManageCategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);
    final selectedItems = useState<Set<int>>({});
    final assets = AppAssetsConstants();
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.colors.secondary,
      appBar: AppBar(
        backgroundColor: theme.colors.secondary,
        title: Row(
          children: [
            IconButton(
              icon: SvgPicture.asset(
                assets.icArrowBackward,
                width: theme.spaces.space_100,
                height: theme.spaces.space_200,
              ),
              onPressed: () {},
            ),
            Text(data.txtManageCategories,
                style: AppTheme.of(context)
                    .typography
                    .h500
                    .copyWith(color: AppTheme.of(context).colors.text)),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: theme.spaces.space_100 * 2.875),
            child: TextButton(
              onPressed: () {
                selectedItems.value = Set.from(Iterable.generate(7, (i) => i));
              },
              child: Text(data.txtSelectAll,
                  style: theme.typography.h500
                      .copyWith(color: theme.colors.primary)),
            ),
          ),
        ],
      ),
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
