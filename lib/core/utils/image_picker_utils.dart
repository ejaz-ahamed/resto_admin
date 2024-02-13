import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resto_admin/core/constants/edit_profile_page/profile_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/utils/snack_bar_utils.dart';

class ImagePickerUtils {
  static Future<XFile?> pickImageFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      return pickedImage;
    } else {
      Future.sync(
        () => SnackBarUtils.showMessage(context, "No Image picked"),
      );
      return null;
    }
  }

  static Future<XFile?> pickImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return pickedImage;
    } else {
      Future.sync(
        () => SnackBarUtils.showMessage(context, "No Image picked"),
      );
      return null;
    }
  }

  static void showDialogueForImagePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: AppTheme.of(context).colors.secondary,
          title: Consumer(
            builder: (context, ref, child) => Column(
              children: [
                TextButton(
                    onPressed: () {
                      ImagePickerUtils.pickImageFromCamera(context);
                    },
                    child: Text(
                      ref.watch(profilePageContstantsProvider).txtCamera,
                      style: AppTheme.of(context).typography.h500,
                    )),
                TextButton(
                    onPressed: () {
                      ImagePickerUtils.pickImageFromGallery(context);
                    },
                    child: Text(
                      ref.watch(profilePageContstantsProvider).txtGallery,
                      style: AppTheme.of(context).typography.h500,
                    )),
              ],
            ),
          )),
    );
  }
}