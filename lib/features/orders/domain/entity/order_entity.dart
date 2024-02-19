import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/features/orders/domain/entity/order_item_entity.dart';
part 'order_entity.freezed.dart';

@freezed
class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    required String orderId,
    required String location,
    required DateTime time,
    required List<OrderItemEntity> ordersItem,
    required OrderType orderType,
  }) = _OrderEntity;
}
