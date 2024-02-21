import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/utils/image_picker_utils.dart';
import 'package:resto_admin/core/widgets/add_image_widget.dart';

final offerImageProvider = StateProvider<XFile?>((ref) {
  return null;
});

class ImagePickerOfferWidget extends ConsumerWidget {
  final StateProvider<XFile?> imgProvider;
  const ImagePickerOfferWidget({super.key, required this.imgProvider});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imagePathPicked = ref.watch(offerImageProvider)?.path;

    /// Image to show if the image is already picked
    Widget? imageToShow;
    if (imagePathPicked != null && imagePathPicked.startsWith('http')) {
      imageToShow = Image.network(
        imagePathPicked,
        fit: BoxFit.cover,
      );
    } else if (imagePathPicked != null) {
      imageToShow = Image.file(
        File(imagePathPicked),
        fit: BoxFit.fill,
      );
    }
    return InkWell(
      onTap: () async {
        final imageSelected =
            await ImagePickerUtils.showDialogueForImagePicker(context);
        ref.read(offerImageProvider.notifier).state = imageSelected;
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
        child: imageToShow ??
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: AddImageWidget(),
                ),
                SizedBox(
                  height: AppTheme.of(context).spaces.space_100,
                ),
              ],
            ),
      ),
    );
  }
}
