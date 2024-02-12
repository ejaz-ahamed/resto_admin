import 'package:go_router/go_router.dart';
import 'package:resto_admin/features/edit_profile_page/presentation/pages/edit_password_page.dart';
import 'package:resto_admin/features/edit_profile_page/presentation/pages/edit_profile_page.dart';

final router = GoRouter(routes: [
  GoRoute(
      path: EditProfilePage.routePath,
      builder: (context, state) => const EditProfilePage()),
  GoRoute(
      path: EditPasswordPage.routePath,
      builder: (context, state) => const EditPasswordPage()),
]);
