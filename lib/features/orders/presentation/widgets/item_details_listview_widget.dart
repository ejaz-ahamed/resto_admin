import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/presentation/widgets/text_regular_widget.dart';

class ItemsDetailsListviewDetails extends ConsumerWidget {
  final List<OrderEntity> entity;
  const ItemsDetailsListviewDetails({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final constants = ref.watch(orderpageConstantsProvider);
    final appTheme = AppTheme.of(context);

  
    return SizedBox(
      height: appTheme.spaces.space_500 * entity.length,
      child: ListView.builder(
        itemCount: entity.length,
        itemBuilder: (context, index) {
          final data = entity[index].items![index];
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: appTheme.spaces.space_300),
            child: Padding(
              padding: EdgeInsets.all(appTheme.spaces.space_100 * 1.25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextRegularWidget(text: data.type),
                  SizedBox(
                    width: appTheme.spaces.space_500 * 4.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextRegularWidget(text: data.productId!),
                        TextRegularWidget(text: data.quantity.toString()),
                        TextRegularWidget(text: data.quantity.toString()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
