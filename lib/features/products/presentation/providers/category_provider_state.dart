import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_provider_state.freezed.dart';

@freezed
class CategoryProviderState with _$CategoryProviderState {
  factory CategoryProviderState({
    required String selectedCategory,
  }) = _CategoryProviderState;
}
