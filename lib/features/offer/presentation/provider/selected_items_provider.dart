import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedItemsProvider =
    StateNotifierProvider<SelectedItemsNotifier, Set<int>>(
  (ref) => SelectedItemsNotifier(),
);

class SelectedItemsNotifier extends StateNotifier<Set<int>> {
  SelectedItemsNotifier() : super({});

  void updateSelectedItems(Set<int> newItems) {
    state = newItems;
  }
}
