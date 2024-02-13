import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    return AppBar(
      scrolledUnderElevation: 0,
      titleSpacing: appTheme.spaces.space_300,
      title: Row(
        children: [
          InkWell(
            child: SvgPicture.asset(
              'assets/icons/ic_arrow_backward.svg',
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
  Size get preferredSize => const Size.fromHeight(70);
}
