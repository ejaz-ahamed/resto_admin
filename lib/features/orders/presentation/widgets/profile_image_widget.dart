import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/authentication/domain/entity/user_entity.dart';

class ProfileImageWidget extends ConsumerWidget {
  final UserEntity userDetails;

  const ProfileImageWidget({
    super.key,
    required this.userDetails,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    AppAssetsConstants iconsConstats = AppAssetsConstants();
    return Container(
      width: appTheme.spaces.space_500 * 2.7,
      height: appTheme.spaces.space_500 * 2.7,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: appTheme.colors.textSubtlest,
          width: appTheme.spaces.space_25,
        ),
      ),
      child: Builder(builder: (context) {
        /// If the user have a valid image, then show it
        if (userDetails.imgPath.trim().isNotEmpty) {
          return CircleAvatar(
            backgroundImage: NetworkImage(userDetails.imgPath),
          );
        } else {
          /// User have no image selected, showing the default image
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconsConstats.icUser,
                height: appTheme.spaces.space_600,
                colorFilter:
                    ColorFilter.mode(appTheme.colors.text, BlendMode.srcATop),
              ),
            ],
          );
        }
      }),
    );
  }
}
