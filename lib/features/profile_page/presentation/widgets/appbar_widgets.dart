import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/profile_page/profile_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class Appbar extends ConsumerWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/ic_arrow_backward.svg',
          height: AppTheme.of(context).spaces.space_200,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          ref.watch(profilePageProvider).txtTitle,
          style: AppTheme.of(context).typography.h500,
        )
      ],
    );
  }
}
