import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class AppbarWidget extends StatelessWidget {
  final String tittle;
  final Widget? action;
  const AppbarWidget({super.key, required this.tittle, this.action});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.of(context).colors.secondary,
      title: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/ic_arrow_backward.svg'),
          ),
          Text(
            tittle,
            // style: AppTheme.of(context)
            // .typography
            // .h500
            // .copyWith(color: AppTheme.of(context).colors.text),
          ),
        ],
      ),
    );
  }
}
