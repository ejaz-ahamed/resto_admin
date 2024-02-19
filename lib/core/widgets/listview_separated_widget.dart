import 'package:flutter/material.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';

class ListViewSeparatedWidget extends StatelessWidget {
  final List<CategoryEntity> entity;
  const ListViewSeparatedWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_150),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: theme.spaces.space_250,
                    backgroundImage: NetworkImage(entity[index].imagePath),
                  ),
                  Text(entity[index].name)
                ],
              ),
            ),
        separatorBuilder: (context, index) => SizedBox(
              width: theme.spaces.space_500,
            ),
        itemCount: entity.length);
  }
}
