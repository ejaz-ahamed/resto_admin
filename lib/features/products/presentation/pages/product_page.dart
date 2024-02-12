import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class ProductPage extends ConsumerWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);
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
                  .copyWith(color: AppTheme.of(context).colors.text),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: AppTheme.of(context).spaces.space_400,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppTheme.of(context).spaces.space_300),
            child: InkWell(
              child: Container(
                  height: MediaQuery.sizeOf(context).height / 3.8,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppTheme.of(context).colors.textSubtle,
                          width: AppTheme.of(context).spaces.space_25),
                      borderRadius: BorderRadius.circular(
                          AppTheme.of(context).spaces.space_100)),
                  child: Column(children: [
                    IconButton(
                        onPressed: () {},
                        icon:
                            SvgPicture.asset('assets/icons/ic_add_image.svg')),
                  ])),
            ),
          )
        ],
      ),
    );
  }
}
