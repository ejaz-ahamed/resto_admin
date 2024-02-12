// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:resto_admin/core/themes/app_theme.dart';

// class BottomNaviWidget extends StatefulWidget {
//   const BottomNaviWidget({super.key});

//   @override
//   State<BottomNaviWidget> createState() => _BottomNaviWidgetState();
// }

// class _BottomNaviWidgetState extends State<BottomNaviWidget> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     final theme = AppTheme.of(context);
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
//       child: Container(
//           width: 382,
//           height: 75,
//           decoration: BoxDecoration(
//               // color: Colors.white,
//               borderRadius: BorderRadius.circular(60),
//               boxShadow: [
//                 BoxShadow(
//                     color: AppTheme.of(context).colors.textSubtle,
//                     blurRadius: 0.25,
//                     spreadRadius: 0,
//                     offset: Offset(0, 4))
//               ]),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(60),
//             child: BottomNavigationBar(
//               // selectedItemColor: Colors.white,
//               // unselectedItemColor: Colors.red,
//               currentIndex: selectedIndex,
//               // backgroundColor: Colors.white,
//               showSelectedLabels: false,
//               showUnselectedLabels: false,
//               onTap: (value) {
//                 setState(() {
//                   selectedIndex = value;
//                 });
//               },
//               items: [
//                 BottomNavigationBarItem(
//                     icon: Container(
//                       width: 40,
//                       height: 40,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(96),
//                           color: selectedIndex == 0
//                               ? theme.colors.primary
//                               : Colors.white),
//                       child: Center(
//                         child: SvgPicture.asset(
//                           'asset/icons/ic_home_icon.svg',
//                           height: 20,
//                           width: 20,
//                           color: selectedIndex == 0 ? Colors.white : Colors.red,
//                         ),
//                       ),
//                     ),
//                     label: ''),
//                 BottomNavigationBarItem(
//                     icon: Container(
//                       width: 40,
//                       height: 40,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(96),
//                           color: selectedIndex == 1
//                               ? theme.colors.primary
//                               : Colors.white),
//                       child: Center(
//                         child: SvgPicture.asset(
//                           'asset/icons/ic_bowl_icon.svg',
//                           height: 24,
//                           width: 20,
//                           color: selectedIndex == 1 ? Colors.white : Colors.red,
//                         ),
//                       ),
//                     ),
//                     label: ''),
//                 BottomNavigationBarItem(
//                     icon: Container(
//                       width: 40,
//                       height: 40,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(96),
//                           color: selectedIndex == 2
//                               ? theme.colors.primary
//                               : Colors.white),
//                       child: Center(
//                         child: SvgPicture.asset(
//                           'asset/icons/ic_bag_icon.svg',
//                           height: 24,
//                           width: 20,
//                           color: selectedIndex == 2 ? Colors.white : Colors.red,
//                         ),
//                       ),
//                     ),
//                     label: ''),
//                 BottomNavigationBarItem(
//                     icon: Container(
//                       width: 40,
//                       height: 40,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(96),
//                           color: selectedIndex == 3
//                               ? theme.colors.primary
//                               : Colors.white),
//                       child: Center(
//                         child: SvgPicture.asset(
//                           'asset/icons/ic_offer_icon.svg',
//                           height: 24,
//                           width: 20,
//                           color: selectedIndex == 3 ? Colors.white : Colors.red,
//                         ),
//                       ),
//                     ),
//                     label: ''),
//               ],
//             ),
//           )),
//     );
//   }
// }
