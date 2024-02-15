import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/rounded_check_box_widget.dart';

class GridViewOfferPageWidget extends ConsumerWidget {
  const GridViewOfferPageWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return GridView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: 5,
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
          boxShadow: [theme.boxShadow.primary],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: theme.spaces.space_150),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: theme.spaces.space_500 * 3.7,
                    height: theme.spaces.space_500 * 3.7,
                    decoration: BoxDecoration(
                      color: theme.colors.textInverse,
                    ),
                  ),
                  Positioned(
                      top: theme.spaces.space_100,
                      right: theme.spaces.space_100,
                      child: RoundedCheckboxWidget(
                        isChecked: false,
                        isSelectAll: false,
                        onChanged: (value) {},
                      ))
                ],
              ),
              SizedBox(
                height: theme.spaces.space_50,
              ),
              const Text("data"),
            ],
          ),
        ),
      ),
    );
  }
}
