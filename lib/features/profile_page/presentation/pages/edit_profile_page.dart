import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/profile_page/profile_page_constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/utils/image_picker_utils.dart';
import 'package:resto_admin/core/widgets/add_image_widget.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/features/profile_page/domain/entity/profile_entity.dart';
import 'package:resto_admin/features/profile_page/presentation/providers/profile_provider.dart';
import 'package:resto_admin/features/profile_page/presentation/widgets/select_closing_time_widget.dart';

import 'package:resto_admin/features/profile_page/presentation/widgets/select_opening_time_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:resto_admin/features/authentication/presentation/provider/authentication_provider.dart';

/// To store the image selected in the image picker
final editImageProvider = StateProvider<XFile?>((ref) => null);

class EditProfilePage extends HookConsumerWidget {
  static const routePath = '/editprofile';

  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(profilePageConstantsProvider);

    final appTheme = AppTheme.of(context);

    useEffect(() {
      /// Clear the image already selected in the image provider
      ref.invalidate(editImageProvider);
      return null;
    }, []);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: appTheme.colors.secondary,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(appTheme.spaces.space_700),
            child: AppBarWidget(title: constants.txtEditprofile)),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: appTheme.spaces.space_400,
                horizontal: appTheme.spaces.space_300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Ink(
                        height: appTheme.spaces.space_400 * 7,
                        width: appTheme.spaces.space_400 * 7,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: appTheme.colors.textDisabled,
                                width: appTheme.spaces.space_25)),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(
                              appTheme.spaces.space_900 * 100),
                          onTap: () async {
                            final imageSelected = await ImagePickerUtils
                                .showDialogueForImagePicker(context, true);
                            ref.read(editImageProvider.notifier).state =
                                imageSelected;
                          },
                          child: switch (ref.watch(userProfileStreamProvider)) {
                            AsyncData(:final value) => Builder(
                                builder: (context) {
                                  /// If the user is selected new image in the image picker,
                                  /// then show it
                                  final selectedImage =
                                      ref.watch(editImageProvider);
                                  if (selectedImage != null &&
                                      selectedImage.path.isNotEmpty) {
                                    return ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            appTheme.spaces.space_900 * 100),
                                        child: Image.file(
                                            File(selectedImage.path)));
                                  }

                                  /// If the user is not selected any image for this account so far
                                  /// the show a default image view
                                  ///
                                  /// or If the user clicked on the 'Delete' button, then
                                  /// the newly selected image path becomes empty.
                                  /// So in this case we need to show the default image
                                  else if ((selectedImage != null &&
                                          selectedImage.path.isEmpty) ||
                                      (value.imgPath.trim().isEmpty)) {
                                    return const AddImageWidget();
                                  }

                                  /// If the user already have a valid image selected previously,
                                  /// then show it
                                  else if (value.imgPath.trim().isNotEmpty) {
                                    return ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            appTheme.spaces.space_900 * 100),
                                        child: Image.network(value.imgPath));
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                },
                              ),
                            AsyncError() => const Center(
                                child: FittedBox(
                                  child: Text('Cannot Load User Image'),
                                ),
                              ),
                            _ => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          },
                        ))),
                const SizedBox32Widget(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async {
                        final TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: ref.watch(openingTimeProvider));
                        if (pickedTime != null) {
                          ref.read(openingTimeProvider.notifier).state =
                              pickedTime;
                        }
                      },
                      child: const SelectOpeningTimeWidget(),
                    ),
                    const SizedBox24Widget(),
                    InkWell(
                      onTap: () async {
                        final TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: ref.watch(closingTimeProvider));
                        if (pickedTime != null) {
                          ref.read(closingTimeProvider.notifier).state =
                              pickedTime;
                        }
                      },
                      child: const SelectClosingTimeWidget(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ElevatedButtonWidget(
            text: constants.txtSave,
            onPressed: () async {
              ref.read(profileProvider.notifier).setTime(
                  ref.watch(openingTimeProvider).toString(),
                  ProfileEntity(
                    openingTime: ref
                        .watch(openingTimeProvider)
                        .format(context)
                        .toString(),
                    closingTime: ref
                        .watch(closingTimeProvider)
                        .format(context)
                        .toString(),
                  ));

              /// Image to upload
              final image = ref.read(editImageProvider);

              /// Only when the user select a new image, upload the new image
              /// Else use the existing image
              if (image != null) {
                await ref
                    .read(profileProvider.notifier)
                    .upload(ref.watch(editImageProvider)!.path);
              }

              Future.sync(() => context.pop());
            }),
      ),
    );
  }
}
