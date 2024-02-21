import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/features/products/presentation/pages/add_category_page.dart';
import 'package:resto_admin/features/products/presentation/providers/category_provider.dart';
import 'package:resto_admin/features/products/presentation/widgets/view_category_widget.dart';

class ViewCategoriesPage extends ConsumerWidget {
  static const routePath = '/viewCategories';
  const ViewCategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);
    final theme = AppTheme.of(context);

    return Scaffold(
      backgroundColor: theme.colors.secondary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(theme.spaces.space_700),
        child: AppBarWidget(
          title: data.txtManageCategories,
        ),
      ),
      body: Builder(
        builder: (context) {
          return switch (ref.watch(getAllCategoryProvider)) {
            AsyncData(:final value) => SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(theme.spaces.space_300),
                      child: SizedBox(
                        width: theme.spaces.space_100 * 47.5,
                        child: ViewCategoriesWidget(entity: value),
                      ),
                    ),
                  ],
                ),
              ),
            AsyncError() => const Center(
                child: Center(
                  child: Text('Error while getting data'),
                ),
              ),
            _ => const Center(
                child: CircularProgressIndicator(),
              )
          };
        },
      ),
      bottomNavigationBar: ElevatedButtonWidget(
        text: data.txtAddCategory,
        onPressed: () {
          context.push(AddCategoryPage.routePath);
        },
      ),
    );
  }
}
