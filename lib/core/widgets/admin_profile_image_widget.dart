import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/constants/profile_constants/profile_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/authentication/presentation/provider/authentication_provider.dart';
import 'package:shimmer/shimmer.dart';

class AdminProfileImageWidget extends ConsumerWidget {
  final double height;
  final double width;
  const AdminProfileImageWidget(
      {super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);

    final constants = ref.watch(profilePageConstantsProvider);

    return Align(
      alignment: Alignment.center,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                color: appTheme.colors.textDisabled,
                width: appTheme.spaces.space_25)),
        child: switch (
            ref.watch(userProfileStreamProvider(constants.txtAdminUserId))) {
          AsyncData(:final value) => Builder(builder: (context) {
              /// If the image is not set by the user, then show a
              /// default user image
              if (value.imgPath.trim().isEmpty) {
                return Padding(
                  padding: EdgeInsets.all(appTheme.spaces.space_900),
                  child: SvgPicture.asset(
                    ref.watch(appAssetsConstantsProvider).icUser,
                    height: height / 5,
                    colorFilter: ColorFilter.mode(
                        appTheme.colors.textSubtle, BlendMode.srcATop),
                  ),
                );
              } else {
                return ClipRRect(
                    borderRadius:
                        BorderRadius.circular(appTheme.spaces.space_900 * 100),
                    child: Image.network(value.imgPath));
              }
            }),
          AsyncError() => const Center(
              child: FittedBox(
                child: Text('Cannot Load User Image'),
              ),
            ),
          _ => Center(
              child: Shimmer.fromColors(
                baseColor: appTheme.colors.textInverse,
                highlightColor: appTheme.colors.textSubtle,
                child: CircleAvatar(
                  radius: height / 2,
                ),
              ),
            ),
        },
      ),
    );
  }
}
