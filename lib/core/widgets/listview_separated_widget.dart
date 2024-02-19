import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';

class ListViewSeparatedWidget extends StatelessWidget {
  final List<CategoryEntity> entity;

  const ListViewSeparatedWidget({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_150),
              child: SizedBox(
                width: theme.spaces.space_100 * 9,
                // height: theme.spaces.space_100*9,
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: theme.spaces.space_250,
                        backgroundImage: NetworkImage(entity[index].imagePath),
                      ),
                      Text(
                        entity[index].name,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
        itemCount: entity.length);
  }
}
