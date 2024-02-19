import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_addon_entity.freezed.dart';

@freezed
class ProductAddOnEntity with _$ProductAddOnEntity {
  factory ProductAddOnEntity({
    required String name,
    required String id,
    required String price,
  }) = _ProductAddOnEntity;
}
