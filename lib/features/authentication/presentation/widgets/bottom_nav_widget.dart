import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widget/under_construction_widget.dart';
import 'package:resto_admin/features/authentication/presentation/providers/bottom_provider.dart';

class BottomNaviWidget extends ConsumerWidget {
  BottomNaviWidget({super.key});

  final pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(pageProvider);

    final theme = AppTheme.of(context);
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) => ref.read(pageProvider.notifier).state = value,
        children: const [
          UnderConstractionWidget(),
          UnderConstractionWidget(),
          UnderConstractionWidget(),
          UnderConstractionWidget(),
        ],
      ),
      bottomNavigationBar: Card(
        margin: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
        shape: const StadiumBorder(),
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (value) {
            pageController.animateToPage(
              value,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
          items: [
            BottomNavigationBarItem(
                icon: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(96),
                    color: selectedIndex == 0
                        ? theme.colors.primary
                        : theme.colors.secondary,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'asset/icons/ic_home_icon.svg',
                      height: 24,
                      width: 24,
                      colorFilter: selectedIndex == 0
                          ? ColorFilter.mode(
                              theme.colors.secondary, BlendMode.srcATop)
                          : ColorFilter.mode(
                              theme.colors.primary, BlendMode.srcATop),
                      // color: selectedIndex == 0 ? Colors.white : Colors.red,
                    ),
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(96),
                      color: selectedIndex == 1
                          ? theme.colors.primary
                          : theme.colors.secondary),
                  child: Center(
                    child: SvgPicture.asset(
                      'asset/icons/ic_bowl_icon.svg',
                      height: 24,
                      width: 24,
                      colorFilter: selectedIndex == 1
                          ? ColorFilter.mode(
                              theme.colors.secondary, BlendMode.srcATop)
                          : ColorFilter.mode(
                              theme.colors.primary, BlendMode.srcATop),
                    ),
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(96),
                      color: selectedIndex == 2
                          ? theme.colors.primary
                          : theme.colors.secondary),
                  child: Center(
                    child: SvgPicture.asset(
                      'asset/icons/ic_bag_icon.svg',
                      height: 24,
                      width: 24,
                      colorFilter: selectedIndex == 2
                          ? ColorFilter.mode(
                              theme.colors.secondary, BlendMode.srcATop)
                          : ColorFilter.mode(
                              theme.colors.primary, BlendMode.srcATop),
                    ),
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
              icon: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(96),
                    color: selectedIndex == 3
                        ? theme.colors.primary
                        : theme.colors.secondary),
                child: Center(
                  child: SvgPicture.asset(
                    'asset/icons/ic_offer_icon.svg',
                    height: 24,
                    width: 24,
                    colorFilter: selectedIndex == 3
                        ? ColorFilter.mode(
                            theme.colors.secondary, BlendMode.srcATop)
                        : ColorFilter.mode(
                            theme.colors.primary, BlendMode.srcATop),
                  ),
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
