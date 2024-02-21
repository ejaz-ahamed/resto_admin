import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/profile_page/profile_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
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

class EditProfilePage extends HookConsumerWidget {
  static const routePath = '/editprofile';

  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedOpeningTime = ref.watch(openingTimeProvider);
    final selectedClosingTime = ref.watch(closingTimeProvider);
    final constants = ref.watch(profilePageConstantsProvider);
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
                    child: Container(
                      height: appTheme.spaces.space_400 * 7,
                      width: appTheme.spaces.space_400 * 7,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: appTheme.colors.textDisabled,
                              width: appTheme.spaces.space_25)),
                      child: const AddImageWidget(),
                    )),
                const SizedBox32Widget(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async {
                        final TimeOfDay? pickedTime = await showTimePicker(
                            context: context, initialTime: selectedOpeningTime);
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
                            context: context, initialTime: selectedClosingTime);
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
          onPressed: () {
            ref.read(profileProvider.notifier).setTime(
                selectedOpeningTime.toString(),
                ProfileEntity(
                  openingTime: selectedOpeningTime.format(context).toString(),
                  closingTime: selectedClosingTime.format(context).toString(),
                ));

            context.pop();
          },
        ),
      ),
    );
  }
}
