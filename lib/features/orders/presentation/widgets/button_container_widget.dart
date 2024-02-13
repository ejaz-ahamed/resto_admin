import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/constants/orders_constants/orders_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/presentation/widgets/button_widget.dart';

class ButtonContainerWidget extends ConsumerWidget {
  const ButtonContainerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(orderpageConstantsProvider);
    final appTheme = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonWidget(
              text: constants.reject,
              onPressed: () {},
              // color: appTheme.colors.secondary,
              color: Colors.white,
              borderColor: appTheme.colors.textSubtle,
              textColor: appTheme.colors.text,
            ),
            ButtonWidget(
              text: constants.accept,
              onPressed: () {},
              color: appTheme.colors.primary,
              borderColor: appTheme.colors.primary,
              textColor: appTheme.colors.secondary,
            )
          ],
        ),
      ),
    );
  }
}
