import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_item_entity.freezed.dart';

@freezed
class OrderItemEntity with _$OrderItemEntity {
  factory OrderItemEntity({
    required String productId,
    required String type,
    required int quantity,
  }) = _OrderItemEntity;
}
