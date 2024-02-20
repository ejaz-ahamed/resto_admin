import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:resto_admin/features/products/domain/entities/product_addon_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_type_entity.dart';
import 'package:resto_admin/features/products/presentation/providers/product_provider.dart';
import 'package:resto_admin/features/products/presentation/widgets/heading_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/image_picker_product_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/product_type_widget.dart';

class ProductPage extends HookConsumerWidget {
  static const routePath = '/addNewProducts';
  final String id;
  const ProductPage({
    super.key,
    required this.id,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    final data = ref.watch(productConstantsProvider);
    final constants = ref.watch(productConstantsProvider);

    final productController = useTextEditingController();
    final descreptionController = useTextEditingController();
    final productTypeControllers = useState<List<ProductTypeControllers>>([]);
    final productAddonControllers = useState<List<ProductTypeControllers>>([]);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(apptheme.spaces.space_700),
            child: AppBarWidget(title: data.txtAddPrdtsTitle)),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: apptheme.spaces.space_300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox32Widget(),
                ImagePickerProductWidget(imgProvider: imageProvider),
                SizedBox(
                  height: AppTheme.of(context).spaces.space_300,
                ),
                TextFieldWidget(
                    enabled: true,
                    textFieldTitle: data.txtProductName,
                    hintText: data.txtHintProduct,
                    controller: productController),
                TextFieldWidget(
                    enabled: true,
                    maxLines: null,
                    textFieldTitle: data.txtDescription,
                    hintText: data.txtHintDescription,
                    controller: descreptionController),
                HeadingWidget(
                  text: data.txtType,
                ),
                const SizedBox24Widget(),
                ProductTypeWidget(
                  btntxt: data.txtType,
                  style: apptheme.typography.h400
                      .copyWith(color: apptheme.colors.textDisabled),
                  hint: constants.txtType,
                  productTypes: productTypeControllers,
                ),
                const SizedBox32Widget(),
                HeadingWidget(
                  text: data.txtAddOns,
                ),
                const SizedBox24Widget(),
                ProductTypeWidget(
                  btntxt: data.txtAddOns,
                  productTypes: productAddonControllers,
                  style: apptheme.typography.h400
                      .copyWith(color: apptheme.colors.textDisabled),
                  hint: constants.txtAddOns,
                ),
                const SizedBox24Widget(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ElevatedButtonWidget(
            text: data.txtSaveBtn,
            onPressed: () {
              ref.read(productProvider.notifier).addProduct(
                addOns: [
                  for (final addOnController in productAddonControllers.value)
                    ProductAddOnEntity(
                      name: addOnController.nameController.text,
                      id: addOnController.nameController.text,
                      price: addOnController.priceController.text,
                    )
                ],
                types: [
                  for (final typeController in productTypeControllers.value)
                    ProductTypeEntity(
                      name: typeController.nameController.text,
                      price: typeController.priceController.text,
                      id: typeController.nameController.text,
                    )
                ],
                id: '',
                name: productController.text,
                categoryId: id,
                description: descreptionController.text,
                imagePath: ref.watch(imageProvider)!.path,
              );
              context.pop();
            }),
      ),
    );
  }
}
