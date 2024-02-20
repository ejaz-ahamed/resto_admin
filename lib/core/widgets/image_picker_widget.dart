import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/utils/image_picker_utils.dart';
import 'package:resto_admin/core/widgets/add_image_widget.dart';

final imageProvider = StateProvider<XFile?>((ref) {
  return null;
});

class ImagePickerWidget extends ConsumerWidget {
  final StateProvider<XFile?> imgProvider;
  const ImagePickerWidget({super.key, required this.imgProvider});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        ref.read(imageProvider.notifier).state =
            await ImagePickerUtils.showDialogueForImagePicker(context);
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
        child: ref.watch(imgProvider) != null
            ? Image.file(
                File(ref.watch(imageProvider)!.path),
                fit: BoxFit.cover,
              )
            : Column(
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
