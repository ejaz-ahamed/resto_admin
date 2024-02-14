import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class AppBarWidget extends ConsumerWidget {
  final String title;

  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assets = ref.watch(appAssetsConstantsProvider);

    final appTheme = AppTheme.of(context);
    return AppBar(
      backgroundColor: appTheme.colors.secondary,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      titleSpacing: appTheme.spaces.space_300,
      title: InkWell(
        onTap: () => context.pop(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              assets.icArrowBackward,
              height: appTheme.spaces.space_200,
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
      ),
    );
  }
}
