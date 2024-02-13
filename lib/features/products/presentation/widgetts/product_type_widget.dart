import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/products/presentation/widgetts/edit_field_widget.dart';

class ProductTypeWidget extends StatelessWidget {
  final TextEditingController addOnController;
  final TextEditingController addOnPriceController;
  final String hint;

  const ProductTypeWidget(
      {super.key,
      required this.addOnController,
      required this.addOnPriceController,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    final apptheme = AppTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 2; i++)
          Padding(
            padding: EdgeInsets.only(top: apptheme.spaces.space_200),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2.5,
                  child: EditFieldWidget(
                    hintText: "Enter Add-ons",
                    controller: addOnController,
                    enabled: true,
                    onChanged: null,
                    style: apptheme.typography.h400.copyWith(
                        color: apptheme.colors.text,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width / 2.5,
                  child: EditFieldWidget(
                    hintText: "Enter price",
                    controller: addOnPriceController,
                    isPrice: true,
                    enabled: true,
                    style: apptheme.typography.h400.copyWith(
                        color: apptheme.colors.text,
                        fontWeight: FontWeight.w700),
                    onChanged: (value) {
                      value = value.replaceAll('\$', '');
                      if (value.isNotEmpty) {
                        addOnPriceController.text = "\$$value";
                      }
                    },
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
