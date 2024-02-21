import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

// final percentageProvider = StateProvider<TextEditingController>((ref) => TextEditingController());
// final valueProvider = StateProvider<double>((ref) => 100.0);

// final formatStringProvider = Provider<String>((ref) {
//   final percentageController = ref.watch(percentageProvider).state;
//   final value = ref.watch(valueProvider).state;
//   final percentage = double.tryParse(percentageController.text) ?? 0.0;
//   final result = value - ((value * percentage) / 100);
//   return '$percentage% - $value = $result';
// });
final percentageProvider = StateProvider<double>((ref) => 0.0);
final resultProvider = Provider<double>((ref) {
  final percentage = ref.watch(percentageProvider);
  double value = 200;
  return value - ((value * percentage) / 100);
});
final amountProvider = StateProvider<double>((ref) => 0.0);
final amountResultProvider = Provider<double>((ref) {
  final amount = ref.watch(amountProvider);
  double value = 300;
  return value - amount;
});

class TextFieldOfferWidget extends ConsumerWidget {
  final String hintText;
  final TextEditingController controller;
  final TextEditingController? controller1;
  const TextFieldOfferWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      this.controller1});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    // final currentDollarValue = ref.watch(currentStateProvider);
    // final percentageTextController = TextEditingController();
    // final amountTextController = TextEditingController();

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
          if (controller == controller) {
            if (value.isEmpty) {
              const double percentage = 0.0;
              ref.read(percentageProvider.notifier).state = percentage;
            } else {
              final double parsedPercentage = double.tryParse(value) ?? 0.0;
              ref.read(percentageProvider.notifier).state = parsedPercentage;
            }
          } else if (controller == controller1) {
            if (value.isEmpty) {
              const double amount = 0.0;
              ref.read(amountProvider.notifier).state = amount;
            } else {
              final double parsedAmount = double.tryParse(value) ?? 0.0;
              ref.read(amountProvider.notifier).state = parsedAmount;
            }
          }
        });
  }
}
