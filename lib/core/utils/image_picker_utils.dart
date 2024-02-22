import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resto_admin/core/constants/profile_constants/profile_page_constants.dart';
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
        () => SnackBarUtils.showMessage("No Image picked"),
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
        () => SnackBarUtils.showMessage("No Image picked"),
      );
      return null;
    }
  }

  static Future<XFile?> showDialogueForImagePicker(
    BuildContext context, [
    bool showDeleteOption = false,
  ]) async {
    final imageCompleter = Completer<XFile?>();
    await showDialog(
      context: context,
      builder: (context) {
        final theme = AppTheme.of(context);

        return AlertDialog(
          backgroundColor: theme.colors.secondary,
          title: Consumer(
            builder: (context, ref, child) {
              final constants = ref.watch(profilePageConstantsProvider);

              return Column(
                children: [
                  TextButton(
                      onPressed: () async {
                        imageCompleter.complete(
                            await ImagePickerUtils.pickImageFromCamera(
                                context));
                        Future.sync(() => context.pop());
                      },
                      child: Text(constants.txtCamera,
                          style: theme.typography.h500)),
                  TextButton(
                      onPressed: () async {
                        imageCompleter.complete(
                          await ImagePickerUtils.pickImageFromGallery(context),
                        );
                        Future.sync(() => context.pop());
                      },
                      child: Text(constants.txtGallery,
                          style: theme.typography.h500)),

                  /// Show the delete option if required
                  if (showDeleteOption)
                    TextButton(
                        onPressed: () async {
                          /// An empty path is given to remove the selected image
                          imageCompleter.complete(
                            XFile(''),
                          );
                          Future.sync(() => context.pop());
                        },
                        child: Text(constants.txtDelete,
                            style: theme.typography.h500
                                .copyWith(color: theme.colors.primary))),
                ],
              );
            },
          ),
        );
      },
    );

    final imageSelected = await (imageCompleter.future);
    return imageSelected;
  }
}
