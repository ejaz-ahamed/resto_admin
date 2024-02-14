import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/offers/presentation/widgets/rounded_checkbox_widget.dart';

final isCheckedProvider = StateProvider<bool>((_) => false);

class GridViewWidget extends ConsumerWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final isCheckedProvider = ref.watch(isCheckedProvider);

    return Stack(
      children: [
        GridView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: 6,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: theme.spaces.space_250,
              mainAxisSpacing: theme.spaces.space_250,
              mainAxisExtent: theme.spaces.space_900 * 2.75),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(theme.spaces.space_100),
              boxShadow: [
                BoxShadow(
                  blurRadius: 34,
                  spreadRadius: -10,
                  color: Colors.black.withOpacity(0.1),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: theme.spaces.space_150),
              child: Column(
                children: [
                  Checkbox(
                    value: isCheckedProvider.read(index),
                    onChanged: (value) {
                      ref.read(isCheckedProvider.notifier).update((state) {
                        state[index] = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: theme.spaces.space_50,
                  ),
                  const Text("data"),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
