import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_admin/core/constants/app_assets_constants.dart';
import 'package:resto_admin/core/constants/offer_constants/add_offer_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    AddOfferPageConstants constants=AddOfferPageConstants();
    AppAssetsConstants iconConst = AppAssetsConstants();
    return InkWell(
      onTap: () {},
      child: Container(
        height: AppTheme.of(context).spaces.space_500 * 6.05,
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
                iconConst.icAddImage,
                height: AppTheme.of(context).spaces.space_600,
                width: AppTheme.of(context).spaces.space_600,
              ),
            ),
            SizedBox(
              height: AppTheme.of(context).spaces.space_100,
            ),
            Text(
             constants.txtAddImage ,
              style: AppTheme.of(context)
                  .typography
                  .h400
                  .copyWith(color: AppTheme.of(context).colors.textDisabled),
            ),
          ],
        ),
      ),
    );
  }
}
