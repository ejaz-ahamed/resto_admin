import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/add_image_widget.dart';

class ImagePickerWidget extends ConsumerWidget {
  const ImagePickerWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   
    return InkWell(
      onTap: () {},
      child: Container(
        height: AppTheme.of(context).spaces.space_500 * 6,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(AppTheme.of(context).spaces.space_100),
            border: Border.all(
                color: AppTheme.of(context).colors.textSubtle,
                width: AppTheme.of(context).spaces.space_25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: AddImageWidget(),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_100,
            ),
          ],
        ),
      ),
    );
  }
}
