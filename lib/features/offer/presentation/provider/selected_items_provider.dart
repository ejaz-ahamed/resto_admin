import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_items_provider.g.dart';
part 'selected_items_provider.freezed.dart';

@freezed
class SelectProviderState with _$SelectProviderState {
  factory SelectProviderState({
    required Set<String> selectedItems,
  }) = _SelectProviderState;
}

@riverpod
class SelectedItems extends _$SelectedItems {
  @override
  SelectProviderState build() {
    return SelectProviderState(
      selectedItems: {},
    );
  }

  void updateSelectedItems(Set<String> newItems) {
    state = state.copyWith(selectedItems: newItems);
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
