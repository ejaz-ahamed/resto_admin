import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resto_admin/core/constants/offer_constants/add_offer_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';
import 'package:resto_admin/core/widgets/image_picker_widget.dart';
import 'package:resto_admin/core/widgets/text_field_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/listview_products_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/row_heading_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/tab_button_widget.dart.dart';
import 'package:resto_admin/features/offer/presentation/widgets/textfield_widget.dart';

class AddOfferPage extends StatelessWidget {
  const AddOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddOfferPageConstants constants = AddOfferPageConstants();
    final spaces = AppTheme.of(context).spaces;
    final typography = AppTheme.of(context).typography;
    final color = AppTheme.of(context).colors;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: spaces.space_100),
          child: Row(
            children: [
              InkWell(
                  onTap: () {},
                  child:
                      SvgPicture.asset('assets/icons/ic_arrow_backward.svg')),
              SizedBox(
                width: spaces.space_300,
              ),
              Text(
                constants.appbarTitle,
                style: typography.h500.copyWith(
                    color: color.text, fontFamily: constants.interFont),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: spaces.space_200,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
              child: const ImagePickerWidget(),
            ),
            SizedBox(
              height: spaces.space_300,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
              child: TextFieldWidget(
                  textFieldTitle: constants.title,
                  hintText: constants.hintTextTitle,
                  controller: TextEditingController()),
            ),
            SizedBox(
              height: spaces.space_200,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
              child: TextFieldWidget(
                  textFieldTitle: constants.description,
                  hintText: constants.hintTextdescription,
                  controller: TextEditingController()),
            ),
            SizedBox(
              height: spaces.space_200,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
              child: Row(
                children: [
                  Text(
                    constants.offerDetails,
                    style: typography.h400
                        .copyWith(fontFamily: constants.interFont),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: spaces.space_200,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
              child: Row(
                children: [
                  TabButtonWidget(
                    borderColor: color.primary,
                    fillColor: color.primary,
                    buttonText: constants.amountText,
                    textColor: color.secondary,
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: spaces.space_200,
                  ),
                  TabButtonWidget(
                      buttonText: constants.percentageText,
                      textColor: color.textSubtlest,
                      onPressed: () {},
                      borderColor: color.textSubtlest,
                      fillColor: color.secondary),
                ],
              ),
            ),
            SizedBox(
              height: spaces.space_100,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: spaces.space_300),
              child: TextFieldOfferWidget(
                  hintText: constants.hintTextAmount,
                  controller: TextEditingController()),
            ),
            SizedBox(
              height: spaces.space_200,
            ),
            const RowHeadingWidget(),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 3,
              child: ListViewProductsWidget(
                  itemCount: 1,
                  product: 'Hot and sour soup',
                  newPrice: '\$22',
                  oldPrice: '\$33'),
            )
          ],
        ),
      ),
      floatingActionButton: ElevatedButtonWidget(
        text: constants.save,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
