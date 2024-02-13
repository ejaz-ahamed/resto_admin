import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/profile_page/profile_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/app_bar_widget.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/features/edit_profile_page/presentation/pages/edit_profile_page.dart';
import 'package:resto_admin/features/profile_page/presentation/widgets/switch_button_widgets.dart';

class Profilepage extends ConsumerWidget {
  static const routePath = '/profile';
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    final constatnts = ref.watch(profilePageProvider);
    return Scaffold(
      appBar: AppBarWidget(
        title: ref.watch(profilePageProvider).txtTitle,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: apptheme.spaces.space_300,
            vertical: apptheme.spaces.space_400),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: apptheme.spaces.space_200 * 7,
              ),
            ),
            SizedBox(
              height: apptheme.spaces.space_400,
            ),
            Text(
              constatnts.txtOpeningTime,
              style: apptheme.typography.h400,
            ),
            SizedBox(
              height: apptheme.spaces.space_100,
            ),
            const Text("9:36 AM"),
            SizedBox(
              height: apptheme.spaces.space_400,
            ),
            Text(
              constatnts.txtClosingtime,
              style: apptheme.typography.h400,
            ),
            SizedBox(
              height: apptheme.spaces.space_100,
            ),
            const Text("11:30 PM"),
            SizedBox(
              height: apptheme.spaces.space_300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  constatnts.txtDarktheme,
                  style: apptheme.typography.h400,
                ),
                const SwitchButton()
              ],
            ),
            SizedBox(
              height: apptheme.spaces.space_300,
            ),
            Text(
              constatnts.txtUpdatePassword,
              style: apptheme.typography.h400,
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButtonWidget(
        text: constatnts.txtEdit,
        onPressed: () {
          context.push(EditProfilePage.routePath);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
