import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/rounded_check_box_widget.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';

class CategoryGridWidget extends HookConsumerWidget {
  final ValueNotifier<Set<String>> selectedItems;
  final List<CategoryEntity> entity;
  const CategoryGridWidget(
      {super.key, required this.selectedItems, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return GridView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: entity.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: theme.spaces.space_100 * 1.25,
          mainAxisSpacing: theme.spaces.space_100 * 1.5,
          mainAxisExtent: theme.spaces.space_100 * 17.5),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            InkWell(
              onTap: () {
                if (selectedItems.value.contains(entity[index].id)) {
                  selectedItems.value = {...selectedItems.value}
                    ..remove(entity[index].id);
                } else {
                  selectedItems.value = {
                    ...selectedItems.value,
                    entity[index].id
                  };
                }
              },
              child: Container(
                padding: EdgeInsets.all(theme.spaces.space_100),
                decoration: BoxDecoration(
                  color: AppTheme.of(context).colors.secondary,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(theme.spaces.space_100),
                      child: SizedBox(
                        width: theme.spaces.space_100 * 14.5,
                        height: theme.spaces.space_100 * 12,
                        child: Image.network(
                          entity[index].imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      entity[index].name,
                      overflow: TextOverflow.ellipsis,
                      style: theme.typography.h400,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: theme.spaces.space_100,
              right: theme.spaces.space_100,
              child: Container(
                width: theme.spaces.space_250,
                height: theme.spaces.space_250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: theme.colors.primary,
                    width: 0,
                  ),
                ),
                child: RoundedCheckboxWidget(
                  isChecked: selectedItems.value.contains(entity[index].id),
                  onTap: () {
                    if (selectedItems.value.contains(entity[index].id)) {
                      selectedItems.value = {...selectedItems.value}
                        ..remove(entity[index].id);
                    } else {
                      selectedItems.value = {
                        ...selectedItems.value,
                        entity[index].id
                      };
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
