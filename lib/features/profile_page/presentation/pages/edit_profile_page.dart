import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resto_admin/core/constants/edit_profile_page/profile_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/utils/image_picker_utils.dart';
import 'package:resto_admin/core/widgets/add_image_widget.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:resto_admin/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:resto_admin/features/profile_page/presentation/providers/profile_provider.dart';

final editImageProvider = StateProvider<XFile?>((ref) => null);

class EditProfilePage extends HookConsumerWidget {
  static const routePath = '/editprofile';

  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final openingTimeController = useTextEditingController();
    final closingTimeController = useTextEditingController();
    final constants = ref.watch(profilePageContstantsProvider);
    final hintText = ref.watch(profilePageContstantsProvider).txtHintenterHere;
    final appTheme = AppTheme.of(context);
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
                    child: InkWell(
                      onTap: () async {
                        final imageSelected =
                            await ImagePickerUtils.showDialogueForImagePicker(
                                context);
                        ref.read(editImageProvider.notifier).state =
                            imageSelected;
                      },
                      child: Container(
                        height: appTheme.spaces.space_400 * 7,
                        width: appTheme.spaces.space_400 * 7,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: appTheme.colors.textDisabled,
                                width: appTheme.spaces.space_25)),
                        child: StreamBuilder(
                          stream: ref
                              .watch(authenticationProvider.notifier)
                              .getProfileImage(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      appTheme.spaces.space_900 * 100),
                                  child: Image.network(snapshot.data!.imgPath));
                            } else if (snapshot.hasError) {
                              return const Center(
                                child: Text('Error'),
                              );
                            } else if (snapshot.data == null) {
                              return const AddImageWidget();
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                        // child: ref.watch(editImageProvider) == null
                        //     ? const AddImageWidget()
                        //     : ClipRRect(
                        //         borderRadius: BorderRadius.circular(
                        //             appTheme.spaces.space_900 * 100),
                        //         child: Image.file(
                        //             File(ref.watch(editImageProvider)!.path))),
                      ),
                    )),
                const SizedBox32Widget(),
                TextFieldWidget(
                    enabled: true,
                    textFieldTitle: constants.txtOpeningTime,
                    hintText: hintText,
                    controller: openingTimeController),
                const SizedBox24Widget(),
                TextFieldWidget(
                    enabled: true,
                    textFieldTitle: constants.txtClosingTime,
                    hintText: hintText,
                    controller: closingTimeController),
              ],
            ),
          ),
        ),
        bottomNavigationBar: ElevatedButtonWidget(
          text: constants.txtSave,
          onPressed: () {
            ref
                .read(profileProvider.notifier)
                .upload(ref.watch(editImageProvider)!.path);
            ref
                .read(authenticationProvider.notifier)
                .setProfileImage(imagePath: ref.watch(editImageProvider)!.path);

            context.pop();
          },
        ),
      ),
    );
  }
}
