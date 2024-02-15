import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/features/products/data/models/product_addon_model.dart';
import 'package:resto_admin/features/products/data/models/product_type_model.dart';

part 'product_entity.freezed.dart';

@freezed
class ProductEntity with _$ProductEntity {
  factory ProductEntity({
    required String name,
    required String image_path,
    required String description,
    // required List<ProductTypeModel>? types,
    // required List<ProductAddonModel>? addOns,
  }) = _ProductEntity;
}
