import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_items_provider.g.dart';

// final selectedItemsProvider =
//     StateNotifierProvider<SelectedItemsNotifier, Set<int>>(
//   (ref) => SelectedItemsNotifier(),
// );

// class SelectedItemsNotifier extends StateNotifier<Set<int>> {
//   SelectedItemsNotifier() : super({});

//   void updateSelectedItems(Set<int> newItems) {
//     state = newItems;
//   }
// }

@riverpod
class SelectedItems extends _$SelectedItems {
  @override
  Set<String> build() {
    return {};
  }

  void updateSelectedItems(Set<String> newItems) {
    state = newItems;
  }

  void remove(int index) {
    final updatedItems = state.toSet();
    updatedItems.removeWhere((id) => id == index);
    state = updatedItems;
  }

  String percentage(
    double percentage,
    int value,
  ) {
    final result = value - ((value * percentage) / 100);
    return '$percentage - $value = $result';
  }
}
