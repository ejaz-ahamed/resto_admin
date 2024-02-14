import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/under_construction/under_construction_widget.dart';
import 'package:resto_admin/features/offers/presentation/pages/selecting_product_page.dart';
import 'package:resto_admin/features/products/presentation/pages/home_page.dart';
import 'package:resto_admin/features/products/presentation/providers/navbar_selected_page_provider.dart';

class BottomNaviWidget extends HookConsumerWidget {
  static const routePath = '/';
  const BottomNaviWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Theme data
    final space = AppTheme.of(context).spaces;
    final assets = AppAssetsConstants();

    final pageController = usePageController();
    final selectedIndex = ref.watch(navbarSelectedPageProvider);
    final navbarIcons = useMemoized(() => [
          assets.icHome,
          assets.icBowl,
          assets.icBag,
          assets.icOffers,
        ]);

    // Function to handle page changes in a PageView
    void handlePageChange(int value) {
      pageController.animateToPage(
        value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }

    final theme = AppTheme.of(context);
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) =>
            ref.read(navbarSelectedPageProvider.notifier).state = value,
        children: const [
          UnderConstractionWidget(),
          HomePage(),
          OfferSelectingPage(),
          OfferSelectingPage(),
        ],
      ),
      bottomNavigationBar: Card(
        margin: EdgeInsets.symmetric(
            vertical: space.space_300, horizontal: space.space_400),
        shape: const StadiumBorder(),
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (value) {
            handlePageChange(value);
          },
          items: [
            for (var i = 0; i < navbarIcons.length; i++)
              BottomNavigationBarItem(
                  icon: Center(
                    child: Container(
                      width: space.space_600,
                      height: space.space_600,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(space.space_400 * 3),
                        color: selectedIndex == i
                            ? theme.colors.primary
                            : theme.colors.secondary,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          navbarIcons[i],
                          height: space.space_300,
                          width: space.space_300,
                          colorFilter: selectedIndex == i
                              ? ColorFilter.mode(
                                  theme.colors.secondary, BlendMode.srcATop)
                              : ColorFilter.mode(
                                  theme.colors.primary, BlendMode.srcATop),
                        ),
                      ),
                    ),
                  ),
                  label: ''),
          ],
        ),
      ),
    );
  }
}
