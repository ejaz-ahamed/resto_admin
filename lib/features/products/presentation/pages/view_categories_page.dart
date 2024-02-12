import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:resto_admin/core/constants/products_constants/product_constants.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/products/presentation/widget/elevated_button_widget.dart';

class ViewCategories extends ConsumerWidget {
  const ViewCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productConstantsProvider);

    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.secondary,
      appBar: AppBar(
        backgroundColor: AppTheme.of(context).colors.secondary,
        title: Row(
          children: [
            IconButton(
              icon: SvgPicture.asset(
                'assets/icons/backicon.svg',
                width: AppTheme.of(context).spaces.space_100,
                height: AppTheme.of(context).spaces.space_200,
              ),
              onPressed: () {},
            ),
            Text(data.txtManageCategories,
                style: AppTheme.of(context)
                    .typography
                    .h500
                    .copyWith(color: AppTheme.of(context).colors.text)),
          ],
        ),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(AppTheme.of(context).spaces.space_200),
              child: Container(
                height: 600,
                width: 380,
                // color: Colors.blue,
                child: GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 30,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 12,
                      mainAxisExtent: 140
                      // childAspectRatio: 3 / 6,
                      ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        // width: AppTheme.of(context).spaces.space_100 * 14.5,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppTheme.of(context).colors.secondary,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  AppTheme.of(context).spaces.space_100),
                              child: Container(
                                width: AppTheme.of(context).spaces.space_100 *
                                    14.5,
                                height:
                                    AppTheme.of(context).spaces.space_100 * 10,
                                child: Image.network(
                                  'https://www.foodiesfeed.com/wp-content/uploads/2023/04/strawberry-milk-splash.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(
                              'Long category',
                              overflow: TextOverflow.ellipsis,
                              style: AppTheme.of(context).typography.h400,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 0, right: 50),
                              child: Text(
                                'name',
                                style: AppTheme.of(context).typography.h400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          ElevatedButtonWidget(text: data.txtAddCategory, onPressed: () {})
        ],
      ),
    );
  }
}
