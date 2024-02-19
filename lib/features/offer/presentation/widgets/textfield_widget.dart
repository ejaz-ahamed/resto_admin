import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/offer/presentation/pages/edit_offer_page.dart';

class TextFieldOfferWidget extends ConsumerWidget {
  final String hintText;
  final TextEditingController controller;
  const TextFieldOfferWidget(
      {super.key, required this.hintText, required this.controller});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    final currentDollarValue = ref.watch(currentStateProvider);

    return TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          hintText: hintText,
          hintStyle: apptheme.typography.h400.copyWith(
            color: apptheme.colors.textDisabled,
          ),
          border: const OutlineInputBorder(borderSide: BorderSide.none)),
      onChanged: (value) {
        if (value.isEmpty) {
          ref.read(currentStateProvider.notifier).state = 100.0;
          return;
        }

        try {
          final double parsedValue = double.parse(value);
          if (value.endsWith('%')) {
            final double percentageChange = parsedValue / 100;
            final double newValue = currentDollarValue * (1 + percentageChange);
            ref.read(currentStateProvider.notifier).state = newValue;
          } else {
            ref.read(currentStateProvider.notifier).state = parsedValue;
          }
        } catch (e) {
          debugPrint('Invalid input: $e');
        }
      },
    );
  }
}
