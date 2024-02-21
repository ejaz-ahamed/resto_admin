import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
import 'package:resto_admin/features/orders/presentation/providers/order_provider.dart';
import 'package:resto_admin/features/orders/presentation/widgets/text_regular_widget.dart';

class ItemsDetailsListviewDetails extends ConsumerWidget {
  final List<OrderEntity> entity;
  // final List<ProductEntity> productEntity;
  const ItemsDetailsListviewDetails({
    super.key,
    required this.entity,
    //  required this.productEntity,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final constants = ref.watch(orderpageConstantsProvider);
    final appTheme = AppTheme.of(context);

    return SizedBox(
      height: appTheme.spaces.space_500 * entity.length,
      child: ListView.builder(
        itemCount: entity.length,
        itemBuilder: (context, index) {
          final entityData = entity[index].items[index];
          // final productData = productEntity[index].types[index];
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: appTheme.spaces.space_300),
            child: Padding(
              padding: EdgeInsets.all(appTheme.spaces.space_100 * 1.25),
              child: StreamBuilder(
                stream: ref
                    .watch(orderProvider.notifier)
                    .getProductById(entityData.productId!),
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  if (snapshot.hasData) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextRegularWidget(text: data!.name),
                        SizedBox(
                          width: appTheme.spaces.space_500 * 4.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextRegularWidget(text: data.types[index].name),
                              TextRegularWidget(
                                  text: entityData.quantity.toString()),
                              TextRegularWidget(
                                  text:
                                      '${(int.parse(data.types[index].price)) * (entityData.quantity)}'),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Error');
                  } else if (data == null) {
                    return const Text('Null');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
