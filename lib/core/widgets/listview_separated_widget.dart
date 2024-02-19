import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';
import 'package:resto_admin/features/products/presentation/providers/category_provider.dart';

class ListViewSeparatedWidget extends ConsumerWidget {
  final List<CategoryEntity> entity;

  const ListViewSeparatedWidget({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (entity.isNotEmpty) {
            SchedulerBinding.instance.addPostFrameCallback((time) {
              ref.read(categoryProvider.notifier).selectCategory(entity[0].id);
            });
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_150),
            child: SizedBox(
              width: theme.spaces.space_100 * 9,
              // height: theme.spaces.space_100*9,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      ref
                          .read(categoryProvider.notifier)
                          .selectCategory(entity[index].id);
                    },
                    child: CircleAvatar(
                      radius: theme.spaces.space_250,
                      backgroundImage: NetworkImage(entity[index].imagePath),
                    ),
                  ),
                  Text(
                    entity[index].name,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        },
        itemCount: entity.length);
  }
}
