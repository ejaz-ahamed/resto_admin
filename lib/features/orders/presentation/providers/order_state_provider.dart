import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:resto_admin/core/enums/order_type.dart';
import 'package:resto_admin/features/orders/domain/entity/order_entity.dart';
part 'order_state_provider.freezed.dart';

@freezed
class OrderproviderState with _$OrderproviderState {
  factory OrderproviderState({
    required List<OrderEntity>? orders,
    required OrderType orderType,
  }) = _OrderproviderState;
}
