import 'package:flutter/material.dart';
import 'package:resto_admin/feature_orders/presentation/pages/order_view_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const OrderDetalisPage(),
    );
  }
}
