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

final availableFromProvider = StateProvider<TimeOfDay>((ref) {
  return TimeOfDay.now();
});
final availableToProvider = StateProvider<TimeOfDay>((ref) {
  return TimeOfDay.now();
});

class ProductPage extends HookConsumerWidget {
  static const routePath = '/addNewProducts';
  final String id;

  const ProductPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final availableFrom = ref.watch(availableFromProvider);
    final availableTo = ref.watch(availableToProvider);
    final apptheme = AppTheme.of(context);

    final constants = ref.watch(productConstantsProvider);

    final productController = useTextEditingController();
    final descreptionController = useTextEditingController();
    final productTypeControllers = useState<List<ProductTypeControllers>>([]);
    final productAddonControllers = useState<List<ProductTypeControllers>>([]);

    useEffect(() {
      ref.invalidate(imagePickerProvider);
      ref.invalidate(availableFromProvider);
      ref.invalidate(availableToProvider);

      return null;
    }, []);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(apptheme.spaces.space_700),
            child: AppBarWidget(title: constants.txtAddPrdtsTitle)),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: apptheme.spaces.space_300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox32Widget(),
                const ImagePickerProductWidget(),
                SizedBox(
                  height: AppTheme.of(context).spaces.space_300,
                ),
                TextFieldWidget(
                    enabled: true,
                    textFieldTitle: constants.txtProductName,
                    hintText: constants.txtHintProduct,
                    controller: productController),
                TextFieldWidget(
                    enabled: true,
                    maxLines: null,
                    textFieldTitle: constants.txtDescription,
                    hintText: constants.txtHintDescription,
                    controller: descreptionController),
                HeadingWidget(
                  text: constants.txtType,
                ),
                const SizedBox24Widget(),
                SizedBox(
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ProductTypeWidget(
                        onTap: (int index) async {
                          final controllersToDelete =
                              productTypeControllers.value[index];

                          productTypeControllers.value = [
                            ...productTypeControllers.value
                          ]..removeAt(index);

                          controllersToDelete.nameController.dispose();
                          controllersToDelete.priceController.dispose();
                        },
                        btntxt: constants.txtType,
                        productTypes: productTypeControllers,
                        style: apptheme.typography.h400
                            .copyWith(color: apptheme.colors.textDisabled),
                        hint: constants.txtType,
                      );
                    },
                  ),
                ),
                const SizedBox32Widget(),
                HeadingWidget(
                  text: constants.txtAddOns,
                ),
                const SizedBox24Widget(),
                SizedBox(
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ProductTypeWidget(
                        onTap: (int index) async {
                          final controllersToDelete =
                              productAddonControllers.value[index];

                          productAddonControllers.value = [
                            ...productAddonControllers.value
                          ]..removeAt(index);

                          controllersToDelete.nameController.dispose();
                          controllersToDelete.priceController.dispose();
                        },
                        btntxt: constants.txtAddOns,
                        productTypes: productAddonControllers,
                        style: apptheme.typography.h400
                            .copyWith(color: apptheme.colors.textDisabled),
                        hint: constants.txtAddOns,
                      );
                    },
                  ),
                ),
                const SizedBox24Widget(),
                HeadingWidget(
                  text: constants.txtAvailablity,
                ),
                const SizedBox24Widget(),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                          onTap: () async {
                            final pickedTime = await showTimePicker(
                                context: context, initialTime: availableFrom);
                            if (pickedTime != null) {
                              ref.read(availableFromProvider.notifier).state =
                                  pickedTime;
                            }
                          },
                          child: Text(availableFrom.format(context))),
                    ),
                    SizedBox(
                      width: AppTheme.of(context).spaces.space_400 * 5,
                    ),
                    Expanded(
                      child: InkWell(
                          onTap: () async {
                            final pickedTime = await showTimePicker(
                                context: context, initialTime: availableTo);
                            if (pickedTime != null) {
                              ref.read(availableToProvider.notifier).state =
                                  pickedTime;
                            }
                          },
                          child: Text(availableTo.format(context))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: ElevatedButtonWidget(
            text: constants.txtSaveBtn,
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
                  imagePath: ref.watch(imagePickerProvider)!.path,
                  availableFrom: availableFrom.format(context),
                  availableTo: availableTo.format(context));
              context.pop();
            }),
      ),
    );
  }
}
