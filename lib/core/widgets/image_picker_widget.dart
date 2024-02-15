import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends ConsumerWidget {
  const ImagePickerWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);
    final asset = AppAssetsConstants();
    return InkWell(
      onTap: () {
        ImagePickerUtils.showDialogueForImagePicker(context);
      },
      child: Container(
        height: AppTheme.of(context).spaces.space_500 * 6,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(AppTheme.of(context).spaces.space_100),
            border: Border.all(
                color: AppTheme.of(context).colors.textSubtle,
                width: AppTheme.of(context).spaces.space_25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                asset.icAddImage,
                height: AppTheme.of(context).spaces.space_600,
                width: AppTheme.of(context).spaces.space_600,
              ),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_100,
            ),
            Text(
              data.txtAddImg,
              style: AppTheme.of(context)
                  .typography
                  .h400
                  .copyWith(color: AppTheme.of(context).colors.textDisabled),
            ),
          ],
        ),
      ),
    );
  }
}
