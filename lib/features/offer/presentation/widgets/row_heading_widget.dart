import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/text_button_widget.dart';

class RowHeadingWidget extends StatelessWidget {
  const RowHeadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppTheme.of(context).spaces.space_300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Products',
            style: AppTheme.of(context).typography.h400,
          ),
          TextButtonWidget(
              onTap: () {},
              buttonText: 'Add',
              color: AppTheme.of(context).colors.primary)
        ],
      ),
    );
  }
}
