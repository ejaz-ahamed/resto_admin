import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/edit_profile_page/profile_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class AppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(profilePageContstantsProvider);
    final appTheme = AppTheme.of(context);
    return AppBar(
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      titleSpacing: appTheme.spaces.space_300,
      title: Row(
        children: [
          InkWell(
            onTap: () => context.pop(),
            child: SvgPicture.asset(
              constants.icArrowBackward,
              height: appTheme.spaces.space_200,
            ),
          ),
          SizedBox(
            width: appTheme.spaces.space_200,
          ),
          Text(
            title,
            style: appTheme.typography.h600,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
