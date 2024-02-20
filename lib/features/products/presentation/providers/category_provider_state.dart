import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/features/products/domain/entities/category_entity.dart';
part 'category_provider_state.freezed.dart';

@freezed
class CategoryProviderState with _$CategoryProviderState {
  factory CategoryProviderState({
    required List<CategoryEntity> categories,
    required String selectedCategory,
  }) = _CategoryProviderState;
}
