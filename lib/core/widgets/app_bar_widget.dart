// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:resto_admin/core/constants/edit_profile_page/profile_page_constants.dart';
// import 'package:resto_admin/core/themes/app_theme.dart';

// class AppBarWidget extends StatelessWidget {
//   const AppBarWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final appTheme = AppTheme.of(context);
//     return PreferredSize(

//       preferredSize: Size.fromHeight(70),
//       child: AppBar(
//         scrolledUnderElevation: 0,

//         title: Row(
//           children: [
//             InkWell(
//               onTap: context.pop(),
//               child: SvgPicture.asset(
//                 'assets/icons/ic_arrow_backward.svg',
//                 height: appTheme.spaces.space_200,
//               ),
//             ),
//             SizedBox(
//               width: appTheme.spaces.space_200,
//             ),
//             Text(
//               'ref.watch(pro',
//               style: appTheme.typography.h500,
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   // TODO: implement preferredSize
//   Size get preferredSize => throw UnimplementedError();

//   @override
//   // TODO: implement child
//   Widget get child => throw UnimplementedError();
// }
