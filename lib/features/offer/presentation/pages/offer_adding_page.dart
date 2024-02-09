import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
// import 'package:resto_admin/core/widgets/appbar_widget.dart';
import 'package:resto_admin/core/widgets/image_picker_widget.dart';

class OfferAddingPage extends StatelessWidget {
  const OfferAddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppbarWidget(tittle: "hjhjj"),
      body: Column(
        children: [
          SizedBox(
            height: AppTheme.of(context).spaces.space_200,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppTheme.of(context).spaces.space_300),
            child: const ImagePickerWidget(),
          )
        ],
      ),
    );
  }
}
