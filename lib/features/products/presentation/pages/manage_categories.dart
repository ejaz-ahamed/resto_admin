import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/category_Grid_widget.dart';

class ManageCategories extends HookConsumerWidget {
  const ManageCategories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);
    final selectedItems = useState<Set<int>>({});

    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.secondary,
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).colors.secondary,
        title: Row(
          children: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/backicon.svg',
                width: AppTheme.of(context).spaces.space_100,
                height: AppTheme.of(context).spaces.space_200,
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
            padding: EdgeInsets.only(
                right: AppTheme.of(context).spaces.space_100 * 2.875),
            child: TextButton(
              onPressed: () {
                selectedItems.value = Set.from(Iterable.generate(7, (i) => i));
              },
              child: Text(data.txtSelectAll,
                  style: AppTheme.of(context)
                      .typography
                      .h500
                      .copyWith(color: AppTheme.of(context).colors.primary)),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AppTheme.of(context).spaces.space_300),
              child: SizedBox(
                  height: AppTheme.of(context).spaces.space_100 * 68.75,
                  width: AppTheme.of(context).spaces.space_100 * 47.5,
                  child: CategoryGrid(selectedItems: selectedItems)),
            ),
          ),
          ElevatedButtonWidget(text: data.txtDelete, onPressed: () {})
        ],
      ),
    );
  }
}
