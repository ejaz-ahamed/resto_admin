import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resto_admin/core/widgets/bottom_navigation/bottom_nav_widget.dart';
import 'package:resto_admin/features/authentication/presentation/pages/login_page.dart';

class AuthSwitcher extends StatelessWidget {
  const AuthSwitcher({super.key});
  static const routePath = '/';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return const LoginPage();
        } else {
          return const BottomNaviWidget();
        }
      },
    );
  }
}
