import 'package:flutter/material.dart';
import 'package:resto_admin/core/router/router.dart';
import 'package:resto_admin/core/themes/light_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter SAMPLEEEE',
      debugShowCheckedModeBanner: false,
      theme: ref.watch(lightThemeProvider),
      routerConfig: ref.watch(goRouterProvider),
    );
  }
}
