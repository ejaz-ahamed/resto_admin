import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_16_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/presentation/widgets/product_type_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/row_widget.dart';

class OverViewItemsPage extends HookConsumerWidget {
  static const routePath = '/overview';
  final ProductEntity entity;
  const OverViewItemsPage({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = useTextEditingController();
    final TextEditingController typeController = useTextEditingController();
    final TextEditingController priCecontroller = useTextEditingController();

    final apptheme = AppTheme.of(context);
    final data = ref.watch(productConstantsProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            apptheme.spaces.space_700,
          ),
          child: AppBarWidget(
            title: entity.name,
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
                TextFieldWidget(
                  textFieldTitle: data.txtDescription,
                  hintText: entity.description,
                  controller: controller,
                  maxLines: 6,
                ),
                const SizedBox32Widget(),
                RowWidget(
                  text: data.txtType,
                  btnText: '',
                  onPressed: () {},
                ),
                ProductTypeWidget(
                  style: AppTheme.of(context).typography.h400.copyWith(
                      color: AppTheme.of(context).colors.textSubtlest),
                  addOnController: typeController,
                  addOnPriceController: priCecontroller,
                  hint: data.txtFullQty,
                  enabled: true,
                ),
                const SizedBox32Widget(),
                RowWidget(
                  text: data.txtAddOns,
                  btnText: '',
                  onPressed: () {},
                ),
                ProductTypeWidget(
                  style: AppTheme.of(context).typography.h400.copyWith(
                      color: AppTheme.of(context).colors.textSubtlest),
                  addOnController: typeController,
                  addOnPriceController: priCecontroller,
                  hint: data.txtAddOnBtnTitle,
                  enabled: true,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ElevatedButtonWidget(
          text: data.txtSaveBtn,
          onPressed: () {},
        ),
      ),
    );
  }
}
