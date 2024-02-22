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
    required String categoryId,
    required String id,
    required List<ProductTypeEntity> types,
    required List<ProductAddOnEntity> addOns,
    required String availableFrom,
    required String availableUpTo,
  }) = _ProductEntity;
}
