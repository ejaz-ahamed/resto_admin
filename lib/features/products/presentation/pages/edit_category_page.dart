import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_16_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:resto_admin/features/products/presentation/widgets/preferredsize_widget.dart';

class EditCategoryPage extends HookConsumerWidget {
  static const routePath = '/editCategory';
  const EditCategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = useTextEditingController();
    final data = ref.watch(productConstantsProvider);
    final theme = AppTheme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(theme.spaces.space_700),
          child: PreferredAppBarWidget(
              title: data.txtEditCategoryTitle, btnText: data.txtDelete),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_300),
          child: Column(
            children: [
              SizedBox(
                height: theme.spaces.space_200,
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: theme.spaces.space_500 * 6.4,
                color: Colors.amber,
              ),
              const SizedBox16Widget(),
              TextFieldWidget(
                  textFieldTitle: data.txtCategoryName,
                  hintText: data.txtSoups,
                  controller: controller),
            ],
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
