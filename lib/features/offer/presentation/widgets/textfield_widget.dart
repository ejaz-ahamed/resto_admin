import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/constants/offer_constants/add_offer_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class TextFieldOfferWidget extends ConsumerWidget {
  final String hintText;
  final TextEditingController controller;
  const TextFieldOfferWidget(
      {super.key, required this.hintText, required this.controller});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    AddOfferPageConstants constants = AddOfferPageConstants();
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          hintText: hintText,
          hintStyle: apptheme.typography.h400.copyWith(
              color: apptheme.colors.textSubtlest,
              fontFamily: constants.interFont),
          border: const OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}
