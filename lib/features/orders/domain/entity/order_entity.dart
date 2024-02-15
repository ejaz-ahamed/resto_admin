import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/features/orders/data/model/order_enum_model.dart';
import 'package:resto_admin/features/orders/data/model/order_item_model.dart';
part 'order_entity.freezed.dart';

@freezed
class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    required String orderId,
    required String customerName,
    required String location,
    required DateTime time,
    required List<OrderItemModel> ordersItem,
    required OrderEnum orderType,
  }) = _OrderEntity;
}
