import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/light_theme.dart';
import 'package:resto_admin/features/offer/presentation/pages/offer_page.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter SAMPLEEEE',
      debugShowCheckedModeBanner: false,
      theme: ref.watch(lightThemeProvider),
      home: OfferPage(),
    );
  }
}
