import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/profile_constants/profile_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/admin_profile_image_widget.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/features/profile_page/presentation/pages/edit_password_page.dart';
import 'package:resto_admin/features/profile_page/presentation/pages/edit_profile_page.dart';
import 'package:resto_admin/features/profile_page/presentation/widgets/logout_button_widget.dart';
import 'package:resto_admin/features/profile_page/presentation/widgets/select_closing_time_widget.dart';
import 'package:resto_admin/features/profile_page/presentation/widgets/select_opening_time_widget.dart';
import 'package:resto_admin/features/profile_page/presentation/widgets/switch_button_widgets.dart';

class ProfilePage extends ConsumerWidget {
  static const routePath = '/profile';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);

    final constatnts = ref.watch(profilePageConstantsProvider);

    return Scaffold(
      backgroundColor: appTheme.colors.secondary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
          appTheme.spaces.space_700,
        ),
        child: AppBarWidget(
          title: ref.watch(profilePageConstantsProvider).txtTitle,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: appTheme.spaces.space_300,
            vertical: appTheme.spaces.space_400),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdminProfileImageWidget(
              height: appTheme.spaces.space_400 * 7,
              width: appTheme.spaces.space_400 * 7,
            ),
            const SizedBox32Widget(),
            const SelectOpeningTimeWidget(),
            const SizedBox24Widget(),
            const SelectClosingTimeWidget(),
            const SizedBox32Widget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  constatnts.txtDarktheme,
                  style: appTheme.typography.h400,
                ),
                const SwitchButton()
              ],
            ),
            SizedBox(
              height: appTheme.spaces.space_300,
            ),
            InkWell(
              onTap: () => context.push(EditPasswordPage.routePath),
              child: Text(
                constatnts.txtUpdatePassword,
                style: appTheme.typography.h400,
              ),
            ),
            const SizedBox32Widget(),
            const LogoutButtonWidget()
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButtonWidget(
        text: constatnts.txtEdit,
        onPressed: () {
          context.push(
            EditProfilePage.routePath,
          );
        },
      ),
    );
  }
}
