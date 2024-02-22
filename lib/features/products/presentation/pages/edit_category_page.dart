import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/image_picker_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_16_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';
import 'package:resto_admin/features/products/presentation/providers/category_provider.dart';
import 'package:resto_admin/features/products/presentation/widgets/save_button_widget.dart';

class EditCategoryPage extends HookConsumerWidget {
  static const routePath = '/editCategory';
  final CategoryEntity entity;
  const EditCategoryPage({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = useTextEditingController();
    final data = ref.watch(productConstantsProvider);
    final theme = AppTheme.of(context);
    final isLoading = useState<bool>(false);

    useEffect(() {
      Future.delayed(Duration.zero, () {
        ref.read(imageProvider.notifier).state = XFile(entity.imagePath);
        controller.text = entity.name;
      });

      return null;
    }, []);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(theme.spaces.space_700),
          child: AppBarWidget(
            title: data.txtEditCategoryTitle,
            actionButtonName: data.txtDelete,
            onPressed: () {
              ref.read(categoryProvider.notifier).remove(id: entity.id);
              context.pop();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_300),
          child: Column(
            children: [
              SizedBox(
                height: theme.spaces.space_200,
              ),
              ImagePickerWidget(imgProvider: imageProvider),
              const SizedBox16Widget(),
              TextFieldWidget(
                  enabled: true,
                  textFieldTitle: data.txtCategoryName,
                  hintText: data.txtSoups,
                  controller: controller),
            ],
          ),
        ),
        bottomNavigationBar: SaveElevatedButtonWidget(
          child: !isLoading.value
              ? Text(
                  data.txtSaveBtn,
                  style: theme.typography.uiSemibold
                      .copyWith(color: theme.colors.secondary),
                )
              : Center(
                  child: Padding(
                  padding: EdgeInsets.all(theme.spaces.space_100),
                  child: CircularProgressIndicator(
                    color: theme.colors.secondary,
                  ),
                )),
          onPressed: () async {
            isLoading.value = true;
            await ref.read(categoryProvider.notifier).updateCategory(
                id: entity.id,
                imagePath: ref.watch(imageProvider)!.path,
                name: controller.text);
            Future.sync(() => context.pop());
          },
        ),
      ),
    );
  }
}
