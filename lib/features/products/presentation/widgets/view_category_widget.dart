import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/products/presentation/pages/edit_category_page.dart';
import 'package:resto_admin/features/products/presentation/pages/manage_categories_page.dart';

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
        return Container(
          padding: EdgeInsets.all(theme.spaces.space_100),
          decoration: BoxDecoration(
            color: theme.colors.secondary,
            borderRadius: BorderRadius.circular(theme.spaces.space_100),
            boxShadow: [
              BoxShadow(
                color: theme.boxShadow.secondary.color,
                spreadRadius: theme.boxShadow.secondary.spreadRadius,
                blurRadius: theme.boxShadow.secondary.blurRadius,
                offset: theme.boxShadow.secondary.offset,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    AppTheme.of(context).spaces.space_100),
                child: InkWell(
                  onTap: () => context.push(EditCategoryPage.routePath),
                  onLongPress: () => context.push(
                    ManageCategoriesPage.routePath,
                  ),
                  child: SizedBox(
                    width: theme.spaces.space_100 * 14.5,
                    height: theme.spaces.space_100 * 10,
                    child: Image.network(
                      'https://www.foodiesfeed.com/wp-content/uploads/2023/04/strawberry-milk-splash.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Text(
                'Long category',
                overflow: TextOverflow.ellipsis,
                style: theme.typography.h400,
              ),
            ],
          ),
        );
      },
    ));
  }
}
