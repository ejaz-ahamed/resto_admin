import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class ViewCategoriesWidget extends StatelessWidget {
  const ViewCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    width: AppTheme.of(context).spaces.space_100 * 14.5,
                    height: AppTheme.of(context).spaces.space_100 * 10,
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
                  padding: const EdgeInsets.only(left: 0, right: 50),
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
    ));
  }
}
