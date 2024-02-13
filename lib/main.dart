import 'package:flutter/material.dart';
import 'package:resto_admin/core/router/router.dart';
import 'package:resto_admin/core/themes/light_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/features/offer/presentation/pages/add_offer_page.dart';
import 'package:resto_admin/features/offer/presentation/pages/offer_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ref.watch(lightThemeProvider),
      home:  AddOfferPage(),
      // routerConfig: ref.watch(goRouterProvider),
    );
  }
}
