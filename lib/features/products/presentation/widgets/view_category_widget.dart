import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';

class ViewCategoriesWidget extends StatelessWidget {
  const ViewCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return SingleChildScrollView(
        child: GridView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 30,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: theme.spaces.space_100 * 1.25,
          mainAxisSpacing: theme.spaces.space_100 * 1.5,
          mainAxisExtent: theme.spaces.space_100 * 17.5),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            padding: EdgeInsets.all(theme.spaces.space_100),
            decoration: BoxDecoration(
              color: AppTheme.of(context).colors.secondary,
              borderRadius: BorderRadius.circular(theme.spaces.space_100),
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
                  padding: EdgeInsets.only(
                      left: 0, right: theme.spaces.space_100 * 6.25),
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
