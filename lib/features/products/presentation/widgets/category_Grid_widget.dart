import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/rounded_check_box_widget.dart';

class CategoryGridWidget extends HookConsumerWidget {
  final ValueNotifier<Set<int>> selectedItems;
  const CategoryGridWidget({
    super.key,
    required this.selectedItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return SingleChildScrollView(
      child: GridView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 7,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: theme.spaces.space_100 * 1.25,
            mainAxisSpacing: theme.spaces.space_100 * 1.5,
            mainAxisExtent: theme.spaces.space_100 * 17.5),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(theme.spaces.space_100),
                      child: SizedBox(
                        width: theme.spaces.space_100 * 14.5,
                        height: theme.spaces.space_100 * 10,
                        child: Image.network(
                          'https://www.cnet.com/a/img/resize/36e8e8fe542ad9af413eb03f3fbd1d0e2322f0b2/hub/2023/02/03/afedd3ee-671d-4189-bf39-4f312248fb27/gettyimages-1042132904.jpg?auto=webp&fit=crop&height=1200&width=1200',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'Long category',
                      overflow: TextOverflow.ellipsis,
                      style: theme.typography.h400,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 0, right: theme.spaces.space_100 * 6.25),
                      child: Text(
                        'name',
                        style: theme.typography.h400,
                      ),
                    ),
                  ],
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
                    color: theme.colors.secondary,
                    border: Border.all(
                      color: theme.colors.primary,
                      width: 0,
                    ),
                  ),
                  child: Positioned(
                    top: theme.spaces.space_100,
                    left: theme.spaces.space_100,
                    child: RoundedCheckboxWidget(
                      isChecked: selectedItems.value.contains(index),
                      onTap: () {
                        if (selectedItems.value.contains(index)) {
                          selectedItems.value = {...selectedItems.value}
                            ..remove(index);
                        } else {
                          selectedItems.value = {...selectedItems.value, index};
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
