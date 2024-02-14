import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/widgets/bottom_navigation/bottom_nav_widget.dart';
import 'package:resto_admin/features/edit_profile_page/presentation/pages/edit_password_page.dart';
import 'package:resto_admin/features/edit_profile_page/presentation/pages/edit_profile_page.dart';
import 'package:resto_admin/features/offer/presentation/pages/add_offer_page.dart';
import 'package:resto_admin/features/orders/presentation/pages/orderview_page.dart';
import 'package:resto_admin/features/products/presentation/pages/home_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final router = GoRouter(initialLocation: BottomNaviWidget.routePath, routes: [
  GoRoute(
    path: BottomNaviWidget.routePath,
    builder: (context, state) => const BottomNaviWidget(),
  ),
  GoRoute(
<<<<<<< HEAD
      path: OfferSelectingPage.routePath,
      builder: (context, state) => const OfferSelectingPage()),
=======
    path: HomePage.routePath,
    builder: (context, state) => const HomePage(),
  ),
>>>>>>> main
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
