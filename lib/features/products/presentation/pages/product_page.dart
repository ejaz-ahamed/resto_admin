import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    );
  }
}
