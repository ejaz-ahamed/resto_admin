import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/profile_page/profile_page_constants.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/ic_arrow_backward.svg',
          height: 20,
        ),
        SizedBox(
          width: 15,
        ),
        const Text(ProfilepageConstants.txtTitle)
      ],
    );
  }
}
