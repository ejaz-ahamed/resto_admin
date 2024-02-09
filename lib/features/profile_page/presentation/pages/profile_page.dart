import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_admin/core/constants/profile_page/profile_page_constants.dart';
import 'package:resto_admin/features/profile_page/presentation/widgets/appbar_widgets.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Appbar(),
        // title: Row(
        //   children: [
        //     SvgPicture.asset(
        //       'assets/images/ic_arrow_backward.svg',
        //       height: 20,
        //     ),
        //     SizedBox(
        //       width: 15,
        //     ),
        //     const Text(ProfilepageConstants.txtTitle)
        //   ],
        // ),
      ),
    );
  }
}
