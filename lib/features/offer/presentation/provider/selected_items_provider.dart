import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_items_provider.g.dart';
part 'selected_items_provider.freezed.dart';

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

@freezed
class SelectProviderState with _$SelectProviderState {
  factory SelectProviderState({
    required Set<String> selectedItems,
    required int totalProducts,
  }) = _SelectProviderState;
}

@riverpod
class SelectedItems extends _$SelectedItems {
  @override
  SelectProviderState build() {
    return SelectProviderState(selectedItems: {}, totalProducts: 0);
  }

  void updateSelectedItems(Set<String> newItems) {
    state = state.copyWith(selectedItems: newItems);
  }

  /// Update the products count
  void updateProductsCount(int count) {
    state = state.copyWith(totalProducts: count);
  }

  void remove(int index) {
    final updatedItems = state.selectedItems;
    updatedItems.removeWhere((id) => id == index);
    state = state.copyWith(selectedItems: updatedItems);
  }

  String percentage(
    double percentage,
    int value,
  ) {
    final result = value - ((value * percentage) / 100);
    return '$percentage - $value = $result';
  }
}
