import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/image_picker_widget.dart';

class AddCategory extends ConsumerWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    final data = ref.watch(productConstantsProvider);
    final asset = AppAssetsConstants();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(asset.icArrowBackward)),
            Text(
              data.txtAddCategoryTitle,
              style: AppTheme.of(context)
                  .typography
                  .h600
                  .copyWith(color: apptheme.colors.text),
            ),
          ],
        ),
      ),
      body: const Column(
        children:  [
          ImagePickerWidget(),
        ],
      ),
    );
  }
}
