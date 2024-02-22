import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/loading_category_widget.dart';
import 'package:resto_admin/core/widgets/category_listview_separated_widget.dart';
import 'package:resto_admin/core/widgets/product_gridview_widget.dart';
import 'package:resto_admin/features/products/presentation/pages/product_page.dart';
import 'package:resto_admin/features/products/presentation/pages/view_categories_page.dart';
import 'package:resto_admin/features/products/presentation/providers/category_provider.dart';
import 'package:resto_admin/features/products/presentation/widgets/row_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/textfield_widget.dart';
import 'package:resto_admin/features/profile_page/presentation/pages/profile_page.dart';
import 'package:shimmer/shimmer.dart';
// import 'package:shimmer/shimmer.dart';

class HomePage extends HookConsumerWidget {
  static const routePath = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);
    final theme = AppTheme.of(context);

    final searchController = useTextEditingController();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: theme.colors.secondary,
          appBar: AppBar(
            backgroundColor: theme.colors.secondary,
            scrolledUnderElevation: 0,
            title: Padding(
              padding: EdgeInsets.only(left: theme.spaces.space_100),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => context.push(ProfilePage.routePath),
                    child: SizedBox(
                      width: theme.spaces.space_600,
                      height: theme.spaces.space_600,
                      child: Shimmer.fromColors(
                        baseColor: theme.colors.textInverse,
                        highlightColor: theme.colors.textSubtle,
                        child: CircleAvatar(
                          radius: theme.spaces.space_300,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: theme.spaces.space_100 * 2,
                  ),
                  Text(
                    data.txtProductTitle,
                    style: theme.typography.h800,
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_300),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: theme.spaces.space_400,
                  ),
                  SearchTextFieldWidget(searchController: searchController),
                  SizedBox(
                    height: theme.spaces.space_300,
                  ),
                  RowWidget(
                    btnText: data.txtEditbtn,
                    text: data.txtCategory,
                    onPressed: () => context.push(
                      ViewCategoriesPage.routePath,
                    ),
                  ),
                  SizedBox(
                    height: theme.spaces.space_250,
                  ),
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
                        _ => const Center(child: LoadingCategoryWidget()),
                      }),
                  SizedBox(
                    height: theme.spaces.space_300,
                  ),
                  RowWidget(
                    text: data.txtItems,
                    btnText: data.txtAddBtn,
                    onPressed: () => context.push(ProductPage.routePath,
                        extra: ref.read(categoryProvider).selectedCategory),
                  ),
                  SizedBox(
                    height: theme.spaces.space_250,
                  ),
                  const ProductGridViewWidget(),
                  SizedBox(
                    height: theme.spaces.space_250,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
