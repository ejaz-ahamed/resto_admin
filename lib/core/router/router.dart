import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/widgets/bottom_navigation/bottom_nav_widget.dart';
import 'package:resto_admin/features/authentication/presentation/pages/auth_switcher.dart';
import 'package:resto_admin/features/offer/presentation/pages/add_offer_page.dart';
import 'package:resto_admin/features/orders/presentation/pages/orderview_page.dart';
import 'package:resto_admin/features/products/presentation/pages/home_page.dart';
import 'package:resto_admin/features/profile_page/presentation/pages/edit_password_page.dart';
import 'package:resto_admin/features/profile_page/presentation/pages/edit_profile_page.dart';
import 'package:resto_admin/features/profile_page/presentation/pages/profile_page.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final router = GoRouter(initialLocation: AuthSwitcher.routePath, routes: [
  GoRoute(
    path: BottomNaviWidget.routePath,
    builder: (context, state) => const BottomNaviWidget(),
  ),
  GoRoute(
    path: HomePage.routePath,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: ProfilePage.routePath,
    builder: (context, state) => const ProfilePage(),
  ),
  GoRoute(
    path: EditProfilePage.routePath,
    builder: (context, state) => const EditProfilePage(),
  ),
  GoRoute(
    path: EditPasswordPage.routePath,
    builder: (context, state) => const EditPasswordPage(),
  ),
  GoRoute(
    path: AddOfferPage.routePath,
    builder: (context, state) => const AddOfferPage(),
  ),
  GoRoute(
    path: OrderViewPage.routePath,
    builder: (context, state) => const OrderViewPage(),
  ),
]);

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return router;
}
