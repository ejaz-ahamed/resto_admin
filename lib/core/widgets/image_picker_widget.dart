import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class ImagePickerWidget extends ConsumerWidget {
  const ImagePickerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.sizeOf(context).height / 3.5,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(AppTheme.of(context).spaces.space_200),
            border: Border.all(color: Colors.grey, width: 1)),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(AppTheme.of(context).spaces.space_100 * 10),
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/icons/ic_add_image.svg",
                  height: AppTheme.of(context).spaces.space_600,
                  width: AppTheme.of(context).spaces.space_600,
                ),
                const Text(
                  "Add Image",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
