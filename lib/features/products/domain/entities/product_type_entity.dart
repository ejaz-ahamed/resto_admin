import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_type_entity.freezed.dart';

@freezed
class ProductTypeEntity with _$ProductTypeEntity {
  factory ProductTypeEntity({
    required String name,
    required String price,
    required String id,
  }) = _ProductTypeEntity;
}
