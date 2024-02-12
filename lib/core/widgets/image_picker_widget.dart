import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.sizeOf(context).height / 3.55,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(AppTheme.of(context).spaces.space_100),
            border: Border.all(
                color: AppTheme.of(context).colors.textSubtle, width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/icons/ic_add_image.svg',
                height: AppTheme.of(context).spaces.space_600,
                width: AppTheme.of(context).spaces.space_600,
              ),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_100,
            ),
            Text(
              'Add Image',
              style: AppTheme.of(context).typography.h400.copyWith(
                  color: AppTheme.of(context)
                      .colors
                      .textSubtlest
                      .withOpacity(.60)),
            ),
          ],
        ),
      ),
    );
  }
}