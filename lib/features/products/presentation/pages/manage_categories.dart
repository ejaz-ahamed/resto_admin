import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/category_grid_widget.dart';

class ManageCategoriesPage extends HookConsumerWidget {
  static const routePath = '/manageCotegory';
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
        titleSpacing: theme.spaces.space_300,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                context.pop();
              },
              child: Row(
                children: [
                  SvgPicture.asset(
                    assets.icArrowBackward,
                    height: theme.spaces.space_200,
                  ),
                  SizedBox(
                    width: theme.spaces.space_200,
                  ),
                  Text(
                    data.txtManageCategories,
                    style: theme.typography.h700,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    data.txtSelectAll,
                    style: theme.typography.h300.copyWith(
                      color: theme.colors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(theme.spaces.space_300),
              child: SizedBox(
                  width: theme.spaces.space_100 * 47.5,
                  child: CategoryGridWidget(selectedItems: selectedItems)),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ElevatedButtonWidget(
        text: data.txtDelete,
        onPressed: () {},
      ),
    );
  }
}
