import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/light_theme.dart';
import 'package:resto_admin/features/offer/presentation/pages/offer_adding_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter SAMPLEEEE',
      theme:ref.watch(lightThemeProvider),
      home: const OfferAddingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
