import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/view_category_widget.dart';

class ViewCategoriesPage extends ConsumerWidget {
  const ViewCategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);
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
                style: theme.typography.h500
                    .copyWith(color: AppTheme.of(context).colors.text)),
          ],
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(theme.spaces.space_300),
              child: SizedBox(
                height: theme.spaces.space_100 * 68.75,
                width: theme.spaces.space_100 * 47.5,
                child: const ViewCategoriesWidget(),
              ),
            ),
          ),
          ElevatedButtonWidget(text: data.txtAddCategory, onPressed: () {})
        ],
      ),
    );
  }
}
