import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/bottom_navigation/bottom_nav_widget.dart';
import 'package:resto_admin/core/widgets/elevated_add_button_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:resto_admin/features/products/domain/entities/product_addon_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_type_entity.dart';
import 'package:resto_admin/features/products/presentation/providers/product_provider.dart';
import 'package:resto_admin/features/products/presentation/widgets/image_picker_product_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/product_type_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/row_widget.dart';

class ProductPage extends HookConsumerWidget {
  static const routePath = '/addNewProducts';
  const ProductPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    final data = ref.watch(productConstantsProvider);
    final constants = ref.watch(productConstantsProvider);
    // final List<ProductEntity> entity;
    final productController = useTextEditingController();
    final descreptionController = useTextEditingController();
    final fullQtyController = useTextEditingController();
    final fullQtyPriceController = useTextEditingController();
    final addOnItemController = useTextEditingController();
    final addOnPriceController = useTextEditingController();

    final isEnabled = useState<bool>(false);

    void onPress(bool changed) {
      isEnabled.value = changed;
    }

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
                    textFieldTitle: data.txtProductName,
                    hintText: data.txtHintProduct,
                    controller: productController),
                TextFieldWidget(
                    textFieldTitle: data.txtDescription,
                    hintText: data.txtHintDescription,
                    controller: descreptionController),
                RowWidget(
                  text: data.txtType,
                  btnText: data.txtEditbtn,
                  onPressed: () {
                    onPress(true);
                  },
                ),
                const SizedBox24Widget(),
                ProductTypeWidget(
                    cursor: isEnabled.value,
                    style: apptheme.typography.h400
                        .copyWith(color: apptheme.colors.textDisabled),
                    enabled: isEnabled.value,
                    hint: constants.txtType,
                    addOnController: fullQtyController,
                    addOnPriceController: fullQtyPriceController),
                const SizedBox24Widget(),
                ElevatedAddButtonWidget(
                  buttonText: data.elevatedBtnTxt,
                  textColor: apptheme.colors.primary,
                  onPressed: () {},
                  icon: Icons.add,
                ),
                const SizedBox32Widget(),
                RowWidget(
                  text: data.txtAddOns,
                  btnText: data.txtEditbtn,
                  onPressed: () {
                    onPress(true);
                  },
                ),
                const SizedBox24Widget(),
                ProductTypeWidget(
                    cursor: isEnabled.value,
                    style: apptheme.typography.h400
                        .copyWith(color: apptheme.colors.textDisabled),
                    enabled: isEnabled.value,
                    hint: constants.txtAddOns,
                    addOnController: addOnItemController,
                    addOnPriceController: addOnPriceController),
                const SizedBox24Widget(),
                ElevatedAddButtonWidget(
                    buttonText: data.txtAddOnBtnTitle,
                    textColor: apptheme.colors.primary,
                    onPressed: () {},
                    icon: Icons.add),
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
                  ProductAddOnEntity(
                    name: fullQtyController.text,
                    id: '',
                    price: fullQtyPriceController.text,
                  )
                ],
                types: [
                  ProductTypeEntity(
                    name: addOnItemController.text,
                    price: addOnPriceController.text,
                    id: '',
                  )
                ],
                id: '',
                name: productController.text,
                description: descreptionController.text,
                imagePath: ref.watch(imageProvider)!.path,
              );
              context.go(BottomNaviWidget.routePath);
            }),
      ),
    );
  }
}
