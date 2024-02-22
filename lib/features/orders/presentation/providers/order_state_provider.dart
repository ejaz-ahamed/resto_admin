import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
part 'order_state_provider.freezed.dart';

@freezed
class OrderproviderState with _$OrderproviderState {
  factory OrderproviderState({
    // required Stream<List<OrderEntity>> orders,
    required List<OrderEntity>? searchOrder,
    required OrderStatus orderStatus,
  }) = _OrderproviderState;
}
