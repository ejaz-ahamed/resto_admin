import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/features/products/domain/entities/product_entity.dart';
part 'order_item_entity.freezed.dart';

@freezed
class OrderItemEntity with _$OrderItemEntity {
  factory OrderItemEntity({
    required ProductEntity product,
    required String type,
    required int quantity,
  }) = _OrderItemEntity;
}
