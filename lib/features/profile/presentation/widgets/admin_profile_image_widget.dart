import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/profile/presentation/pages/edit_profile_page.dart';

class AdminProfileImageWidget extends ConsumerWidget {
  final Widget child;
  const AdminProfileImageWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () => context.push(EditProfilePage.routePath),
          child: Container(
            height: appTheme.spaces.space_400 * 7,
            width: appTheme.spaces.space_400 * 7,
            padding: EdgeInsets.all(appTheme.spaces.space_900),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: appTheme.colors.textDisabled,
                    width: appTheme.spaces.space_25)),
            child: child,
          ),
        ));
  }
}
