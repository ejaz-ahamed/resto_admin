import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/light_theme.dart';
import 'package:resto_admin/features/offers/presentation/pages/offer_adding_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      home:  const OfferAddingPage(),
    );
  }
}
