import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';
import 'package:resto_admin/features/products/presentation/providers/category_provider.dart';
import 'package:resto_admin/features/products/presentation/providers/product_provider.dart';

class ListViewSeparatedWidget extends HookConsumerWidget {
  final List<CategoryEntity> entity;
  final TextEditingController? clearController;

  const ListViewSeparatedWidget({
    super.key,
    required this.entity,
    this.clearController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);

    useEffect(() {
      if (entity.isNotEmpty) {
        Future.delayed(Duration.zero, () {
          ref.read(categoryProvider.notifier).selectCategory(entity[0].id);
        });
      }
      return null;
    }, []);

    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_150),
            child: SizedBox(
              width: theme.spaces.space_900,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      clearController?.clear();
                      ref.read(productProvider.notifier).clearSearchList();
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
