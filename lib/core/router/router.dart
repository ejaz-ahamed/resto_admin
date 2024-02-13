import 'package:go_router/go_router.dart';
import 'package:resto_admin/features/edit_profile_page/presentation/pages/edit_password_page.dart';
import 'package:resto_admin/features/edit_profile_page/presentation/pages/edit_profile_page.dart';
import 'package:resto_admin/features/products/presentation/pages/home_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final router = GoRouter(initialLocation: EditProfilePage.routePath, routes: [
  GoRoute(
      path: HomePage.routePath, builder: (context, state) => const HomePage()),
  GoRoute(
      path: EditProfilePage.routePath,
      builder: (context, state) => const EditProfilePage()),
  GoRoute(
      path: EditPasswordPage.routePath,
      builder: (context, state) => const EditPasswordPage()),
]);

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return router;
}
