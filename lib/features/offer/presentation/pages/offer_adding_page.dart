import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/image_picker_widget.dart';

class OfferAddingPage extends ConsumerWidget {
  const OfferAddingPage({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    return  Scaffold(
      appBar : AppBar(
      backgroundColor: AppTheme.of(context).colors.secondary,
      title: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/ic_arrow_backward.svg'),
          ),
          Text(
            "Add Offers",
            style: AppTheme.of(context)
            .typography
            .h500
            .copyWith(color: AppTheme.of(context).colors.text),
          ),
        ],
      ),
    )  ,
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
