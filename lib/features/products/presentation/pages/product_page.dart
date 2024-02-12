import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/elevated_add_button_widget.dart';
import 'package:resto_admin/core/widgets/image_picker_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:resto_admin/features/products/presentation/widgetts/edit_field_widget.dart';
import 'package:resto_admin/features/products/presentation/widgetts/row_widget.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    final data = ref.watch(productConstantsProvider);
    final productController = TextEditingController();
    final descreptionController = TextEditingController();
    final fullQtyController = TextEditingController(text: "Full");
    final fullQtyPriceController = TextEditingController(text: "\$25.00");
    // final halfQtyController = TextEditingController();
    // final halfQtypriceController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset('assets/icons/ic_arrow_backward.svg')),
            Text(
              data.txtAddPrdtsTitle,
              style: AppTheme.of(context)
                  .typography
                  .h600
                  .copyWith(color: apptheme.colors.text),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: apptheme.spaces.space_300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: apptheme.spaces.space_400,
              ),
              ImagePickerWidget(),
              // InkWell(
              //   child: Container(
              //       height: MediaQuery.sizeOf(context).height / 3.8,
              //       width: MediaQuery.of(context).size.width,
              //       decoration: BoxDecoration(
              //           border: Border.all(
              //               color: apptheme.colors.textSubtle,
              //               width: apptheme.spaces.space_25),
              //           borderRadius:
              //               BorderRadius.circular(apptheme.spaces.space_100)),
              //       child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             IconButton(
              //                 onPressed: () {},
              //                 icon: SvgPicture.asset(
              //                     'assets/icons/ic_add_image.svg')),
              //             Text(
              //               data.txtAddImg,
              //               style: apptheme.typography.h400
              //                   .copyWith(color: apptheme.colors.textSubtlest),
              //             )
              //           ]
              //           )
              //           ),
              // ),
              SizedBox(
                height: AppTheme.of(context).spaces.space_300,
              ),
              TextFieldWidget(
                  textFielTitle: data.txtProductName,
                  hintText: data.txtHintProduct,
                  controller: productController),
              TextFieldWidget(
                  textFielTitle: data.txtDescription,
                  hintText: data.txtHintDescription,
                  controller: descreptionController),
              RowWidget(text: data.txtType, btnText: data.txtEditbtn),
              for (int i = 0; i < 2; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2.5,
                      child: EditFieldWidget(
                        hintText: "Enter type",
                        controller: fullQtyController,
                        enabled: true,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width / 2.5,
                      child: EditFieldWidget(
                        hintText: "Enter price",
                        controller: fullQtyPriceController,
                        isPrice: true,
                        enabled: true,
                      ),
                    )
                  ],
                ),
              SizedBox(
                height: apptheme.spaces.space_100,
              ),
              ElevatedAddButtonWidget(
                buttonText: data.elevatedBtnTxt,
                textColor: apptheme.colors.primary,
                onPressed: () {},
                icon: Icons.add,
              ),
              SizedBox(
                height: apptheme.spaces.space_200,
              ),
              RowWidget(text: data.txtAddOns, btnText: data.txtEditbtn),
            ],
          ),
        ),
      ),
    );
  }
}
