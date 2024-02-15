import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/router/router.dart';
import 'package:resto_admin/core/themes/light_theme.dart';
import 'package:resto_admin/firebase_options.dart';
import 'package:resto_admin/core/themes/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  static final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final navigatorKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      scaffoldMessengerKey: MyApp.scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: ref.watch(themeProvider),
      routerConfig: ref.watch(goRouterProvider),
    );
  }
}
