import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/constants/profile_constants/profile_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_24_widget.dart';
import 'package:resto_admin/core/widgets/sized_box_32_widget.dart';
import 'package:resto_admin/features/profile/presentation/pages/edit_password_page.dart';
import 'package:resto_admin/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:resto_admin/features/profile/presentation/widgets/logout_button_widget.dart';
import 'package:resto_admin/features/profile/presentation/widgets/select_closing_time_widget.dart';
import 'package:resto_admin/features/profile/presentation/widgets/select_opening_time_widget.dart';
import 'package:resto_admin/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:resto_admin/features/profile/presentation/widgets/switch_button_widgets.dart';

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
                child: switch (ref.watch(
                    userProfileStreamProvider(constatnts.txtAdminUserId))) {
                  AsyncData(:final value) => Builder(builder: (context) {
                      /// If the image is not set by the user, then show a
                      /// default user image
                      if (value.imgPath.trim().isEmpty) {
                        return Padding(
                          padding: EdgeInsets.all(appTheme.spaces.space_900),
                          child: SvgPicture.asset(
                            ref.watch(appAssetsConstantsProvider).icUser,
                            height: 50,
                          ),
                        );
                      } else {
                        return ClipRRect(
                            borderRadius: BorderRadius.circular(
                                appTheme.spaces.space_900 * 100),
                            child: Image.network(value.imgPath));
                      }
                    }),
                  AsyncError() => const Center(
                      child: FittedBox(
                        child: Text('Cannot Load User Image'),
                      ),
                    ),
                  _ => const Center(
                      child: CircularProgressIndicator(),
                    ),
                },
              ),
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
