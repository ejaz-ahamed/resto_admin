import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/image_picker_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:resto_admin/features/products/presentation/pages/view_categories_page.dart';
import 'package:resto_admin/features/products/presentation/providers/category_provider.dart';

class AddCategoryPage extends HookConsumerWidget {
  static const routePath = '/addCategory';
  const AddCategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    final data = ref.watch(productConstantsProvider);

    final categoryContoller = useTextEditingController();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(apptheme.spaces.space_700),
            child: AppBarWidget(title: data.txtAddCategoryTitle)),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: apptheme.spaces.space_300),
          child: Column(
            children: [
              const SizedBox32Widget(),
              ImagePickerWidget(imgProvider: imageProvider),
              const SizedBox24Widget(),
              TextFieldWidget(
                  textFieldTitle: data.txtCategory,
                  hintText: data.txtHintProduct,
                  controller: categoryContoller)
            ],
          ),
        ),
        bottomNavigationBar: ElevatedButtonWidget(
            text: data.txtSaveBtn,
            onPressed: () {
              ref.read(categoryProvider.notifier).add(
                  id: '',
                  imagePath: ref.watch(imageProvider)!.path,
                  name: categoryContoller.text);
              context.go(ViewCategoriesPage.routePath);
            }),
      ),
    );
  }
}
