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
  Set<int> build() {
    return {};
  }

  void updateSelectedItems(Set<int> newItems) {
    state = newItems;
  }
}
