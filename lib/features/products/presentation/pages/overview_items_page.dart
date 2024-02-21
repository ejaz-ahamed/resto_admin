import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_16_widget.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/presentation/pages/edit_product_page.dart';
import 'package:resto_admin/features/products/presentation/providers/product_provider.dart';
import 'package:resto_admin/features/products/presentation/widgets/heading_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/column_widget.dart';

class OverViewItemsPage extends HookConsumerWidget {
  static const routePath = '/overview';
  final String productId;
  final String categoryId;

  const OverViewItemsPage({
    super.key,
    required this.productId,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);

    final data = ref.watch(productConstantsProvider);

    final ProductEntity entity = ref
        .watch(getAllProductsByCategoryProvider(categoryId))
        .asData!
        .value
        .firstWhere((product) => product.id == productId);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            apptheme.spaces.space_700,
          ),
          child: AppBarWidget(
            title: entity.name,
            actionButtonName: data.txtDelete,
            onPressed: () {
              ref.read(productProvider.notifier).deleteProduct(entity.id);
              context.pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: apptheme.spaces.space_300),
            child: Column(
              children: [
                SizedBox(
                  height: apptheme.spaces.space_200,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: apptheme.spaces.space_500 * 6.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                      entity.imagePath,
                    ),
                    fit: BoxFit.cover,
                  )),
                ),
                const SizedBox16Widget(),
                Align(
                    alignment: Alignment.centerLeft,
                    child: HeadingWidget(
                      text: data.txtDescription,
                    )),
                const SizedBox16Widget(),
                Text(
                  entity.description,
                  style: apptheme.typography.h300
                      .copyWith(color: apptheme.colors.text),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox16Widget(),
                HeadingWidget(text: data.txtType),
                const SizedBox16Widget(),
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: entity.types.length,
                    itemBuilder: (context, index) {
                      return ColumnWidget(
                          name: entity.types[index].name,
                          price: entity.types[index].price.toString());
                    },
                  ),
                ),
                const SizedBox16Widget(),
                HeadingWidget(text: data.txtAddOns),
                const SizedBox16Widget(),
                SizedBox(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: entity.addOns.length,
                    itemBuilder: (context, index) {
                      return ColumnWidget(
                          name: entity.addOns[index].name,
                          price: entity.addOns[index].price.toString());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ElevatedButtonWidget(
          text: data.txtEditbtn,
          onPressed: () {
            context.push(EditProductPage.routePath, extra: entity);
          },
        ),
      ),
    );
  }
}
