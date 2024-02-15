import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/widgets/bottom_navigation/bottom_nav_widget.dart';
import 'package:resto_admin/features/offer/presentation/pages/add_offer_page.dart';
import 'package:resto_admin/features/offer/presentation/pages/edit_offer_page.dart';
import 'package:resto_admin/features/offer/presentation/pages/offer_selecting_product_page.dart';
import 'package:resto_admin/features/orders/presentation/pages/orderview_page.dart';
import 'package:resto_admin/features/products/presentation/pages/edit_category_page.dart';
import 'package:resto_admin/features/products/presentation/pages/add_category_page.dart';
import 'package:resto_admin/features/products/presentation/pages/home_page.dart';
import 'package:resto_admin/features/products/presentation/pages/overview_items_page.dart';
import 'package:resto_admin/features/profile_page/presentation/pages/edit_password_page.dart';
import 'package:resto_admin/features/profile_page/presentation/pages/edit_profile_page.dart';
import 'package:resto_admin/features/profile_page/presentation/pages/profile_page.dart';

import 'package:resto_admin/features/products/presentation/pages/product_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final router = GoRouter(initialLocation: BottomNaviWidget.routePath, routes: [
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
    path: EditOfferPage.routePath,
    builder: (context, state) => const EditOfferPage(),
  ),
  GoRoute(
    path: OrderViewPage.routePath,
    builder: (context, state) => const OrderViewPage(),
  ),
  GoRoute(
    path: EditCategoryPage.routePath,
    builder: (context, state) => const EditCategoryPage(),
  ),
  GoRoute(
    path: ProductPage.routePath,
    builder: (context, state) => const ProductPage(),
  ),
  GoRoute(
      path: AddOfferPage.routePath,
      builder: (context, state) => const AddOfferPage()),
  GoRoute(
    path: ProductPage.routePath,
    builder: (context, state) => const ProductPage(),
  ),
  GoRoute(
    path: AddCategoryPage.routePath,
    builder: (context, state) => const AddCategoryPage(),
  ),
  GoRoute(
    path: OfferSelectingPage.routePath,
    builder: (context, state) => const OfferSelectingPage(),
  ),
  GoRoute(
    path: OverViewItemsPage.routePath,
    builder: (context, state) => const OverViewItemsPage(),
  )
]);

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return router;
}
