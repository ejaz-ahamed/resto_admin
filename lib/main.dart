import 'package:flutter/material.dart';
import 'package:resto_admin/features/authentication/presentation/pages/homepage.dart';
import 'package:resto_admin/features/authentication/presentation/widgets/bottom_nav_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SAMPLEEEE',
      home: HomePage(),
    );
  }
}
