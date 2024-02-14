import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_16_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';

class OverViewItemsPage extends HookConsumerWidget {
  const OverViewItemsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = useTextEditingController();
    final apptheme = AppTheme.of(context);
    final data = ref.watch(productConstantsProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            apptheme.spaces.space_700,
          ),
          child: const AppBarWidget(
            title: "jjj",
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
                  color: Colors.amber,
                ),
                const SizedBox16Widget(),
                TextFieldWidget(
                  textFieldTitle: data.txtDescriptionTitle,
                  hintText: data.txtDescriptionfull,
                  controller: controller,
                  maxLines: 6,
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
