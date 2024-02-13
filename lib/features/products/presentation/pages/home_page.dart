import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/features/edit_profile_page/presentation/pages/edit_profile_page.dart';

class HomePage extends ConsumerWidget {
  static const routePath = '/homePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: InkWell(
            onTap: () => context.push(EditProfilePage.routePath),
            child: const CircleAvatar()),
        title: Text(
          data.txtProductTitle,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
