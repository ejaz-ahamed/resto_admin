import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/image_picker_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_8_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:resto_admin/features/products/domain/entities/product_addon_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_type_entity.dart';
import 'package:resto_admin/features/products/presentation/providers/product_provider.dart';
import 'package:resto_admin/features/products/presentation/widgets/heading_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/product_type_widget.dart';

final _availableFromProvider = StateProvider<TimeOfDay>((ref) {
  return TimeOfDay.now();
});

final _availableToProvider = StateProvider<TimeOfDay>((ref) {
  return TimeOfDay.now();
});

class EditProductPage extends HookConsumerWidget {
  static const routePath = '/editProducts';
  final ProductEntity entity;

  const EditProductPage({
    super.key,
    required this.entity,
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

    useEffect(() {
      Future.delayed(
        Duration.zero,
        () {
          ref.read(imageProvider.notifier).state = XFile(entity.imagePath);
          productController.text = entity.name;
          descreptionController.text = entity.description;

          /// Add addon controllers
          for (final addon in entity.addOns) {
            final nameController = TextEditingController();
            final priceController = TextEditingController();
            nameController.text = addon.name;
            priceController.text = addon.price;
            productAddonControllers.value = [
              ...productAddonControllers.value,
              ProductTypeControllers(
                  nameController: nameController,
                  priceController: priceController),
            ];
          }
          for (final types in entity.types) {
            final nameController = TextEditingController();
            final priceController = TextEditingController();
            nameController.text = types.name;
            priceController.text = types.price;
            productTypeControllers.value = [
              ...productTypeControllers.value,
              ProductTypeControllers(
                  nameController: nameController,
                  priceController: priceController),
            ];
          }

          /// Set the available from and to time providers
          final timeFormat = DateFormat("h':'m' 'a");
          ref.read(_availableFromProvider.notifier).state =
              TimeOfDay.fromDateTime(timeFormat.parse(entity.availableFrom));
          ref.read(_availableToProvider.notifier).state =
              TimeOfDay.fromDateTime(timeFormat.parse(entity.availableUpTo));
        },
      );

      /// Dispose function

      // return () {
      //   productController.dispose();
      //   descreptionController.dispose();

      //   for (final controller in productAddonControllers.value) {
      //     controller.nameController.dispose();
      //     controller.priceController.dispose();
      //   }

      //   for (final controller in productTypeControllers.value) {
      //     controller.nameController.dispose();
      //     controller.priceController.dispose();
      //   }
      // };
      return null;
    }, []);

    /// Remove a type from the product
    void removeProductType(int index) async {
      final controllersToDelete = productTypeControllers.value[index];

      productTypeControllers.value = [...productTypeControllers.value]
        ..removeAt(index);

      controllersToDelete.nameController.dispose();
      controllersToDelete.priceController.dispose();
    }

    /// Remove an addon from the product
    void removeAddon(int index) async {
      final controllersToDelete = productAddonControllers.value[index];

      productAddonControllers.value = [...productAddonControllers.value]
        ..removeAt(index);

      controllersToDelete.nameController.dispose();
      controllersToDelete.priceController.dispose();
    }

    /// Save the new changes to the product
    void saveProductDetails() async {
      await ref.read(productProvider.notifier).updateProduct(
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
          id: entity.id,
          name: productController.text,
          description: descreptionController.text,
          imagePath: ref.watch(imageProvider)!.path,
          categoryId: entity.categoryId,
          availabeFrom: ref.read(_availableFromProvider).format(context),
          availableTo: ref.read(_availableToProvider).format(context));

      Future.sync(() => context.pop());
    }

    /// Pick the available from time
    void pickAvailableFrom() async {
      final pickedTime = await showTimePicker(
          context: context, initialTime: ref.read(_availableFromProvider));
      if (pickedTime != null) {
        ref.read(_availableFromProvider.notifier).state = pickedTime;
      }
    }

    /// Pick available to time
    void pickAvailableTo() async {
      final pickedTime = await showTimePicker(
          context: context, initialTime: ref.read(_availableToProvider));
      if (pickedTime != null) {
        ref.read(_availableToProvider.notifier).state = pickedTime;
      }
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(apptheme.spaces.space_700),
            child: AppBarWidget(
              title: data.txtEditProductAppbar,
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: apptheme.spaces.space_300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox24Widget(),
                const ImagePickerWidget(),
                const SizedBox24Widget(),
                TextFieldWidget(
                    enabled: true,
                    textFieldTitle: data.txtProductName,
                    hintText: data.txtHintProduct,
                    controller: productController),
                const SizedBox24Widget(),
                TextFieldWidget(
                    enabled: true,
                    maxLines: null,
                    textFieldTitle: data.txtDescription,
                    hintText: data.txtHintDescription,
                    controller: descreptionController),
                const SizedBox32Widget(),
                HeadingWidget(
                  text: data.txtType,
                ),
                const SizedBox8Widget(),
                ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ProductTypeWidget(
                      onTap: removeProductType,
                      btntxt: data.txtType,
                      productTypes: productTypeControllers,
                      style: apptheme.typography.ui,
                      hint: constants.txtType,
                    );
                  },
                ),
                const SizedBox32Widget(),
                HeadingWidget(
                  text: data.txtAddOns,
                ),
                const SizedBox8Widget(),
                ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ProductTypeWidget(
                      onTap: removeAddon,
                      btntxt: data.txtAddOns,
                      productTypes: productAddonControllers,
                      style: apptheme.typography.ui,
                      hint: constants.txtAddOns,
                    );
                  },
                ),
                const SizedBox32Widget(),
                HeadingWidget(
                  text: constants.txtAvailablity,
                ),
                const SizedBox24Widget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: pickAvailableFrom,
                        child: Text(
                          constants.txtFrom +
                              ref.watch(_availableFromProvider).format(context),
                          style: apptheme.typography.ui,
                        )),
                    InkWell(
                        onTap: pickAvailableTo,
                        child: Text(
                          constants.txtTo +
                              ref.watch(_availableToProvider).format(context),
                          style: apptheme.typography.ui,
                        )),
                  ],
                ),
                const SizedBox32Widget(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ElevatedButtonWidget(
            text: data.txtSaveBtn, onPressed: saveProductDetails),
      ),
    );
  }
}
