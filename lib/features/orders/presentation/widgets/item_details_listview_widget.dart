import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resto_admin/core/themes/app_theme.dart';
import 'package:resto_admin/features/orders/presentation/widgets/text_regular_widget.dart';
import 'package:resto_admin/features/products/presentation/providers/product_provider.dart';
import '../../domain/entity/order_item_entity.dart';

class ItemsDetailsListviewDetails extends ConsumerWidget {
  final List<OrderItemEntity> items;
  const ItemsDetailsListviewDetails({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = AppTheme.of(context);
    return SizedBox(
      height: appTheme.spaces.space_500 * items.length,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return FutureBuilder(
            future: ref
                .read(productProvider.notifier)
                .getProductById(items[index].productId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: appTheme.spaces.space_300),
                  child: Padding(
                    padding: EdgeInsets.all(appTheme.spaces.space_100 * 1.25),
                    child: Table(
                      defaultColumnWidth:
                          FixedColumnWidth(appTheme.spaces.space_100 * 10),
                      children: [
                        TableRow(
                          children: [
                            TextRegularWidget(text: snapshot.data!.name),
                            SizedBox(
                              width: appTheme.spaces.space_500,
                            ),
                            TextRegularWidget(text: items[index].type),
                            TextRegularWidget(
                                text: items[index].quantity.toString()),
                            TextRegularWidget(
                                text:
                                    '${(int.parse(snapshot.data!.types[0].price)) * (items[index].quantity)}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('No Order Items'),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        },
      ),
    );
  }
}
