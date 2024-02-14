import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/core/widgets/rounded_check_box_widget.dart';

class CategoryGridWidget extends HookWidget {
  final ValueNotifier<Set<int>> selectedItems;
  const CategoryGridWidget({
    super.key,
    required this.selectedItems,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 7,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: AppTheme.of(context).spaces.space_100 * 1.25,
            mainAxisSpacing: AppTheme.of(context).spaces.space_100 * 1.5,
            mainAxisExtent: AppTheme.of(context).spaces.space_100 * 17.5),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(AppTheme.of(context).spaces.space_100 - 7),
            child: Stack(
              children: [
                Container(
                  padding:
                      EdgeInsets.all(AppTheme.of(context).spaces.space_100),
                  decoration: BoxDecoration(
                    color: AppTheme.of(context).colors.secondary,
                    borderRadius: BorderRadius.circular(
                        AppTheme.of(context).spaces.space_100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(1, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            AppTheme.of(context).spaces.space_100),
                        child: SizedBox(
                          width: AppTheme.of(context).spaces.space_100 * 14.5,
                          height: AppTheme.of(context).spaces.space_100 * 10,
                          child: Image.network(
                            'https://www.cnet.com/a/img/resize/36e8e8fe542ad9af413eb03f3fbd1d0e2322f0b2/hub/2023/02/03/afedd3ee-671d-4189-bf39-4f312248fb27/gettyimages-1042132904.jpg?auto=webp&fit=crop&height=1200&width=1200',
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
                            left: 0,
                            right:
                                AppTheme.of(context).spaces.space_100 * 6.25),
                        child: Text(
                          'name',
                          style: AppTheme.of(context).typography.h400,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: AppTheme.of(context).spaces.space_100,
                  right: AppTheme.of(context).spaces.space_100,
                  child: Container(
                    width: AppTheme.of(context).spaces.space_250,
                    height: AppTheme.of(context).spaces.space_250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: AppTheme.of(context).colors.primary,
                        width: 0,
                      ),
                    ),
                    child: Positioned(
                      top: AppTheme.of(context).spaces.space_100,
                      left: AppTheme.of(context).spaces.space_100,
                      child: RoundedCheckboxWidget(
                        isChecked: selectedItems.value.contains(index),
                        onTap: () {
                          if (selectedItems.value.contains(index)) {
                            selectedItems.value = {...selectedItems.value}
                              ..remove(index);
                          } else {
                            selectedItems.value = {
                              ...selectedItems.value,
                              index
                            };
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
