import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:resto_admin/features/offer/presentation/provider/selected_items_provider.dart';

class EditOfferProductWidget extends HookConsumerWidget {
  // final Set<int> selectedItems;
  static const routePath = '/editofferproductwidget';
  const EditOfferProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(selectedItemsProvider);
    return Scaffold(
      body: Container(
        width: 200,
        height: 400,
        child: ListView.builder(
          itemCount: selectedItems.length,
          itemBuilder: (context, index) {
            final selectedItem = selectedItems.elementAt(index);
            return ListTile(
              title: Text('Item $selectedItem'),
            );
          },
        ),
      ),
    );
  }
}
