import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/widgets/bottom_navigation/bottom_nav_widget.dart';
import 'package:resto_admin/features/authentication/presentation/pages/auth_switcher.dart';
import 'package:resto_admin/features/authentication/presentation/pages/login_page.dart';
import 'package:resto_admin/features/offer/domain/entity/offer_entity.dart';
import 'package:resto_admin/features/offer/presentation/pages/add_offer_page.dart';
import 'package:resto_admin/features/offer/presentation/pages/edit_offer_page.dart';
import 'package:resto_admin/features/offer/presentation/pages/offer_selecting_product_page.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/presentation/pages/orderview_page.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
import 'package:resto_admin/features/products/presentation/pages/edit_category_page.dart';
import 'package:resto_admin/features/products/presentation/pages/add_category_page.dart';
import 'package:resto_admin/features/products/presentation/pages/edit_product_page.dart';
import 'package:resto_admin/features/products/presentation/pages/home_page.dart';
import 'package:resto_admin/features/products/presentation/pages/manage_categories_page.dart';
import 'package:resto_admin/features/products/presentation/pages/overview_items_page.dart';
import 'package:resto_admin/features/products/presentation/pages/view_categories_page.dart';
import 'package:resto_admin/features/profile_page/presentation/pages/edit_password_page.dart';
import 'package:resto_admin/features/profile_page/presentation/pages/edit_profile_page.dart';
import 'package:resto_admin/features/profile_page/presentation/pages/profile_page.dart';
import 'package:resto_admin/features/products/presentation/pages/product_page.dart';
import 'package:resto_admin/main.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final router = GoRouter(
  navigatorKey: MyApp.navigatorKey,
  initialLocation: AuthSwitcher.routePath,
  routes: [
    GoRoute(
      path: AuthSwitcher.routePath,
      builder: (context, state) => const AuthSwitcher(),
    ),
    GoRoute(
      path: BottomNaviWidget.routePath,
      builder: (context, state) => const BottomNaviWidget(),
    ),
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) => const LoginPage(),
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
      builder: (context, state) =>
          EditOfferPage(entity: state.extra as OfferEntity),
    ),
    GoRoute(
      path: OrderViewPage.routePath,
      builder: (context, state) => OrderViewPage(
        entity: state.extra as OrderEntity,
      ),
    ),
    GoRoute(
      path: EditCategoryPage.routePath,
      builder: (context, state) =>
          EditCategoryPage(entity: state.extra as CategoryEntity),
    ),
    GoRoute(
        path: ProductPage.routePath,
        builder: (context, state) {
          return ProductPage(
            id: state.extra as String,
          );
        }),
    GoRoute(
      path: AddOfferPage.routePath,
      builder: (context, state) => const AddOfferPage(),
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
        builder: (context, state) {
          final (String, String) extra = state.extra as (String, String);

          return OverViewItemsPage(
            categoryId: extra.$1,
            productId: extra.$2,
          );
        }),
    GoRoute(
      path: ViewCategoriesPage.routePath,
      builder: (context, state) => const ViewCategoriesPage(),
    ),
    GoRoute(
      path: ManageCategoriesPage.routePath,
      builder: (context, state) =>
          ManageCategoriesPage(entity: state.extra as List<CategoryEntity>),
    ),
    GoRoute(
      path: EditProductPage.routePath,

      builder: (context, state) => EditProductPage(
        entity: state.extra as ProductEntity,
      ),
    ),
  ],
);

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return router;
}
