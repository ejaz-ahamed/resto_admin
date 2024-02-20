import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/elevated_add_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/edit_field_widget.dart';

/// Model class to handle the text editing controller
final class ProductTypeControllers {
  final TextEditingController nameController;
  final TextEditingController priceController;

  ProductTypeControllers(
      {required this.nameController, required this.priceController});
}

class ProductTypeWidget extends HookConsumerWidget {
  final String hint;
  final TextStyle? style;
  final ValueNotifier<List<ProductTypeControllers>> productTypes;
  final String btntxt;

  const ProductTypeWidget({
    super.key,
    required this.hint,
    required this.style,
    required this.productTypes,
    required this.btntxt,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);

    void addNewTypeEntry() {
      productTypes.value = [
        ...productTypes.value,
        ProductTypeControllers(
          nameController: TextEditingController(),
          priceController: TextEditingController(),
        ),
      ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final productType in productTypes.value)
          Padding(
            padding: EdgeInsets.only(top: apptheme.spaces.space_200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: EditFieldWidget(
                    hintText: hint,
                    controller: productType.nameController,
                    onChanged: null,
                    style: style,
                  ),
                ),
                Expanded(
                  child: EditFieldWidget(
                    hintText: ref.watch(productConstantsProvider).txtPrice,
                    controller: productType.priceController,
                    isPrice: true,
                    style: style,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
        const SizedBox24Widget(),
        ElevatedAddButtonWidget(
            buttonText: btntxt,
            textColor: apptheme.colors.primary,
            onPressed: () => addNewTypeEntry(),
            icon: Icons.add),
      ],
    );
  }
}
