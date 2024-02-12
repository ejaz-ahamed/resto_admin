import 'package:flutter/material.dart';
import 'package:resto_admin/core/constants/offer_page_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/offer/presentation/widgets/elevated_button_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/offer_banner_widget.dart';
import 'package:resto_admin/features/offer/presentation/widgets/text_button_widget.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;
    final OfferPageConstants constants = OfferPageConstants();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Padding(
          padding:  EdgeInsets.only(
            left: spaces.space_100,
          ),
          child: Text(
            constants.appbarTitle,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: spaces.space_250),
          ),
        ),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: spaces.space_300),
            child: TextButtonWidget(
                buttonText: constants.addOfferText, color: color.primary),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: spaces.space_200,
            ),
            OfferBannerWidget(
              offerImage: const NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd1Mqj-pwiNWm1ZptXqtx9eNOt_1CNX4lk0g&usqp=CAU'),
              offerText: constants.offerText,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: spaces.space_300, vertical: spaces.space_150),
          child: AddOnButtonWidget(
              buttonText: 'Add Add-on',
              textColor: color.primary,
              onPressed: () {},
              icon: Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
