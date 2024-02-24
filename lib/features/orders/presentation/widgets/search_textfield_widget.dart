import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/presentation/providers/order_provider.dart';

class TextFieldSearchWidget extends HookConsumerWidget {
  final TextEditingController searchController;
  const TextFieldSearchWidget({super.key, required this.searchController});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(orderpageConstantsProvider);
    final theme = AppTheme.of(context);
    AppAssetsConstants iconsConst = AppAssetsConstants();
    return TextField(
      controller: searchController,
      onChanged: (keyword) {
        ref.read(orderProvider.notifier).search(keyword);
      },
      cursorColor: theme.colors.text,
      decoration: InputDecoration(
        hintText: data.txtSearch,
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
        suffixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconsConst.icSearch,
              width: theme.spaces.space_250,
            ),
          ],
        ),
      ),
    );
  }
}
