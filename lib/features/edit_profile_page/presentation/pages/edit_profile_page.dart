import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_admin/core/constants/edit_profile_page/profile_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/add_image_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EditProfilePage extends HookConsumerWidget {
  static const routePath = '/editprofilepage';

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
        appBar: AppBar(
          title: Row(
            children: [
              SvgPicture.asset(
                constants.icArrowBackward,
                height: appTheme.spaces.space_200,
              ),
              SizedBox(
                width: appTheme.spaces.space_200,
              ),
              Text(
                constants.txtEditprofile,
                style: appTheme.typography.h500,
              ),
            ],
          ),
        ),
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
                  child: CircleAvatar(
                    radius: appTheme.spaces.space_200 * 7,
                    child: const AddImageWidget(),
                  ),
                ),
                const SizedBox32Widget(),
                TextFieldWidget(
                    textFieldTitle: constants.txtOpeningTime,
                    hintText: hintText,
                    controller: openingTimeController),
                const SizedBox24Widget(),
                TextFieldWidget(
                    textFieldTitle: constants.txtClosingTime,
                    hintText: hintText,
                    controller: closingTimeController),
              ],
            ),
          ),
        ),
        floatingActionButton: ElevatedButtonWidget(
          text: constants.txtSave,
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
