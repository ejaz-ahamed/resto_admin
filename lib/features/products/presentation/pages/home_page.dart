import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/features/orders/presentation/pages/orderview_page.dart';

class HomePage extends ConsumerWidget {
  static const routePath = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: const CircleAvatar(),
        title: Text(
          data.txtProductTitle,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(OrderViewPage.routePath);
            },
            icon: Icon(
              Icons.forward,
            ),
          ),
        ],
      ),
    );
  }
}
