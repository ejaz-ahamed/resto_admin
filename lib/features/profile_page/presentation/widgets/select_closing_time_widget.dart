import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/constants/profile_page/profile_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/sized_box_16_widget.dart';
import 'package:resto_admin/features/profile_page/presentation/providers/profile_provider.dart';

class SelectClosingTimeWidget extends ConsumerWidget {
  const SelectClosingTimeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(profilePageConstantsProvider);
    final apptheme = AppTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          constants.txtClosingTime,
          style: apptheme.typography.h400,
        ),
        const SizedBox16Widget(),
        StreamBuilder(
            stream: ref.watch(profileProvider.notifier).getTime(),
            builder: (context, snapshot) {
              final data = snapshot.data;
              if (snapshot.hasData) {
                return Text(
                  data!.closingTime.toString(),
                  style: apptheme.typography.h300.copyWith(
                      fontWeight: FontWeight.normal,
                      color: apptheme.colors.textSubtlest),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Text(constants.txtLoading,
                    style: apptheme.typography.h300.copyWith(
                        fontWeight: FontWeight.normal,
                        color: apptheme.colors.textSubtlest));
              } else if (snapshot.data == null) {
                return Text(constants.txtNoTimeSelected,
                    style: apptheme.typography.h300.copyWith(
                        fontWeight: FontWeight.normal,
                        color: apptheme.colors.textSubtlest));
              } else {
                return Text(constants.txtLoading,
                    style: apptheme.typography.h300.copyWith(
                        fontWeight: FontWeight.normal,
                        color: apptheme.colors.textSubtlest));
              }
            }),
      ],
    );
  }
}
