import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/products/presentation/providers/product_provider.dart';

class SearchTextFieldWidget extends HookConsumerWidget {
  final TextEditingController searchController;
  const SearchTextFieldWidget({super.key, required this.searchController});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);
    final theme = AppTheme.of(context);
    return TextField(
      controller: searchController,
      onChanged: (keyword) {
        ref.read(productProvider.notifier).search(keyword);
      },
      onSubmitted: (keyword) {
        ref.read(productProvider.notifier).search(keyword);
      },
      cursorColor: theme.colors.text,
      decoration: InputDecoration(
        hintText: data.txtFieldHint,
        hintStyle: theme.typography.h400.copyWith(
            fontWeight: FontWeight.w400, color: theme.colors.textSubtlest),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(theme.spaces.space_100),
          borderSide: BorderSide(color: theme.colors.textSubtle, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(theme.spaces.space_100),
          borderSide: BorderSide(color: theme.colors.textSubtle, width: 1),
        ),
        suffixIcon: Icon(
          Icons.search,
          color: theme.colors.textSubtlest,
        ),
      ),
    );
  }
}
