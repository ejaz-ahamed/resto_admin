import 'package:flutter/material.dart';
import 'package:resto_admin/features/offer/presentation/pages/offer_adding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SAMPLEEEE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const OfferAddingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
