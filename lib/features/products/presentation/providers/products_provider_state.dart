import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';

part 'products_provider_state.freezed.dart';

@freezed
class ProductProviderState with _$ProductProviderState {
  factory ProductProviderState({
    required List<ProductEntity> selectedCategoryProducts,
    required List<ProductEntity>? searchedProducts,
  }) = _ProductProviderState;
}
