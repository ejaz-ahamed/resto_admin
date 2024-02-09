import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNaviWidget extends StatelessWidget {
  const BottomNaviWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: Container(
          width: 382,
          height: 72,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(60),
              boxShadow: [BoxShadow(color: Color(000000), blurRadius: 0.25)]),
          child: BottomNavigationBar(
              backgroundColor: Colors.white,
              selectedItemColor: Colors.red,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'asset/icons/ic_home_icon.svg',
                      height: 24,
                      width: 24,
                      color: Colors.red,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'asset/icons/ic_bowl_icon.svg',
                      height: 24,
                      width: 24,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'asset/icons/ic_bag_icon.svg',
                      height: 24,
                      width: 24,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'asset/icons/ic_offer_icon.svg',
                      height: 24,
                      width: 24,
                    ),
                    label: ''),
              ]),
        ),
      ),
    );
  }
}
