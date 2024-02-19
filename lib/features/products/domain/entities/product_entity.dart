import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/features/products/domain/entities/product_addon_entity.dart';
import 'package:resto_admin/features/products/domain/entities/product_type_entity.dart';

part 'product_entity.freezed.dart';

@freezed
class ProductEntity with _$ProductEntity {
  factory ProductEntity({
    required String name,
    required String imagePath,
    required String description,
    required String id,
    required String categoryId,
    required List<ProductTypeEntity> types,
    required List<ProductAddOnEntity> addOns,
  }) = _ProductEntity;
}
