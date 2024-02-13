import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class EditCategoryPage extends ConsumerWidget {
  const EditCategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);
    final theme = AppTheme.of(context);
    final assets = AppAssetsConstants();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                onPressed: () {}, icon: SvgPicture.asset(assets.icArrowBack)),
            Text(
              data.txtEditCategoryTitle,
              style: AppTheme.of(context)
                  .typography
                  .h600
                  .copyWith(color: theme.colors.text),
            ),
          ],
        ),
      ),
    );
  }
}
