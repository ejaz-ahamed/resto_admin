import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class ProfileImageWidget extends ConsumerWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    AppAssetsConstants iconsConstats = AppAssetsConstants();
    return Container(
      width: appTheme.spaces.space_500 * 2.7,
      height: appTheme.spaces.space_500 * 2.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          appTheme.spaces.space_900,
        ),
        border: Border.all(
          color: appTheme.colors.textSubtlest,
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconsConstats.icUser,
            height: appTheme.spaces.space_700,
            colorFilter:
                ColorFilter.mode(appTheme.colors.text, BlendMode.srcATop),
          ),
        ],
      ),
    );
  }
}
