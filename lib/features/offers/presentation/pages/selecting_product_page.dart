import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/offers_constants/offers_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/elevated_button_widget.dart';

class OfferAddingPage extends ConsumerWidget {
  const OfferAddingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apptheme = AppTheme.of(context);
    final Constants = ref.watch(offersConstantsProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: apptheme.colors.secondary,
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/ic_arrow_backward.svg'),
            ),
            Text(
              Constants.txtPageTitle,
              style: apptheme.typography.h500
                  .copyWith(color: apptheme.colors.text),
            ),
          ],
        ),
        actions: [TextButton(onPressed: () {}, child: Text("Select All"))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
      bottomNavigationBar: ElevatedButtonWidget(text: "Save", onPressed: () {}),
    );
  }
}
