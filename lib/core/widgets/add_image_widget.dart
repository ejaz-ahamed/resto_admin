import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/constants/edit_profile_page/profile_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/utils/image_picker_utils.dart';
import 'package:resto_admin/core/widgets/sized_box_8_widget.dart';
import 'package:resto_admin/features/profile_page/presentation/pages/edit_profile_page.dart';

class AddImageWidget extends ConsumerWidget {
  const AddImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assets = ref.watch(appAssetsConstantsProvider);
    final constants = ref.watch(profilePageContstantsProvider);
    final appTheme = AppTheme.of(context);
    return InkWell(
      onTap: () async {
        ref.read(editImageProvider.notifier).state =
            await ImagePickerUtils.showDialogueForImagePicker(context);
        log("${ref.watch(editImageProvider)?.path}");
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            assets.icAddImage,
            height: appTheme.spaces.space_500,
          ),
          const SizedBox8Widget(),
          Text(
            constants.txtAddImage,
            style: appTheme.typography.uiSemibold
                .copyWith(color: appTheme.colors.textDisabled),
          )
        ],
      ),
    );
  }
}
