import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_admin/core/constants/profile_page/profile_page_constants.dart';

class AddImageWidget extends StatelessWidget {
  const AddImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset('resto_admin/assets/icons/ic_add_image.svg'),
        Text(ProfilePageContstants.txtAddImage)
      ],
    );
  }
}
